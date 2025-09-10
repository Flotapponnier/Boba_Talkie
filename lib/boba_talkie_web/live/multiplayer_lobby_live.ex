defmodule BobaTalkieWeb.MultiplayerLobbyLive do
  use BobaTalkieWeb, :live_view
  import BobaTalkieWeb.LanguageSelector
  alias BobaTalkieWeb.LanguageSession
  alias BobaTalkie.MultiplayerRoom
  alias Phoenix.PubSub
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(params, session, socket) do
    interface_language = LanguageSession.get_interface_language(params, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(params, session, socket.assigns)
    
    # Get room_id if joining an existing room
    room_id = Map.get(params, "room_id")
    
    # Generate a consistent player ID for this session
    player_id = get_or_create_player_id(session)
    
    socket =
      socket
      |> assign(:page_title, "BobaTalkie - Multiplayer Lobby")
      |> LanguageSession.set_locale_and_assign(interface_language, learning_language)
      |> assign(:room_id, room_id)
      |> assign(:mode, if(room_id, do: :joining, else: :lobby))
      |> assign(:waiting_for_match, false)
      |> assign(:current_room, nil)
      |> assign(:room_link, nil)
      |> assign(:available_topics, get_available_topics())
      |> assign(:player_id, player_id)
      |> assign(:debug_info, %{player_id: player_id, learning_language: learning_language})

    # If joining a room, try to join immediately
    socket = if room_id do
      join_room(socket, room_id)
    else
      socket
    end

    {:ok, socket}
  end

  @impl true
  def handle_event("find_random_match", _params, socket) do
    learning_language = socket.assigns.learning_language
    player_id = socket.assigns.player_id
    
    IO.puts("🔍 Looking for match: player_id=#{player_id}, learning_language=#{learning_language}")
    
    case MultiplayerRoom.find_or_create_match(player_id, learning_language) do
      {:ok, room_id} ->
        IO.puts("✅ Match found/created: room_id=#{room_id}")
        
        # Subscribe to room updates - this is the waiting room for this player
        PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_room:#{room_id}")
        IO.puts("🔗 Player #{player_id} subscribed to room: multiplayer_room:#{room_id}")
        
        # ALSO subscribe to player-specific topic to ensure we get match notifications
        PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_player:#{player_id}")
        IO.puts("🔗 Player #{player_id} subscribed to personal topic: multiplayer_player:#{player_id}")
        
        socket = 
          socket
          |> assign(:waiting_for_match, true)
          |> assign(:current_room, room_id)
          |> put_flash(:info, "Looking for match... Room: #{room_id}")
        
        {:noreply, socket}
      
      {:error, reason} ->
        IO.puts("❌ Match failed: #{reason}")
        socket = put_flash(socket, :error, "Failed to find match: #{reason}")
        {:noreply, socket}
    end
  end

  @impl true
  def handle_event("create_private_party", %{"topic" => topic}, socket) do
    learning_language = socket.assigns.learning_language
    player_id = generate_player_id()
    
    case MultiplayerRoom.create_private_room(player_id, learning_language, topic) do
      {:ok, room_id} ->
        # Subscribe to room updates
        PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_room:#{room_id}")
        
        room_link = "#{BobaTalkieWeb.Endpoint.url()}/multiplayer/#{room_id}"
        
        socket = 
          socket
          |> assign(:current_room, room_id)
          |> assign(:player_id, player_id)
          |> assign(:room_link, room_link)
          |> assign(:mode, :hosting)
          |> assign(:waiting_for_match, true)
        
        {:noreply, socket}
      
      {:error, reason} ->
        socket = put_flash(socket, :error, "Failed to create room: #{reason}")
        {:noreply, socket}
    end
  end

  @impl true
  def handle_event("copy_room_link", _params, socket) do
    {:noreply, push_event(socket, "copy_to_clipboard", %{text: socket.assigns.room_link})}
  end

  @impl true
  def handle_event("leave_room", _params, socket) do
    if socket.assigns.current_room do
      MultiplayerRoom.leave_room(socket.assigns.current_room, socket.assigns.player_id)
      PubSub.unsubscribe(BobaTalkie.PubSub, "multiplayer_room:#{socket.assigns.current_room}")
    end
    
    socket = 
      socket
      |> assign(:waiting_for_match, false)
      |> assign(:current_room, nil)
      |> assign(:room_link, nil)
      |> assign(:mode, :lobby)
      |> assign(:player_id, nil)
    
    {:noreply, socket}
  end

  # Language change handlers
  @impl true
  def handle_event("change_interface_language", %{"value" => language_code}, socket) do
    socket = push_event(socket, "store_and_reload", %{
      interface_language: language_code, 
      learning_language: socket.assigns.learning_language
    })
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("change_learning_language", %{"value" => language_code}, socket) do
    socket = push_event(socket, "store_and_reload", %{
      interface_language: socket.assigns.interface_language,
      learning_language: language_code
    })
    
    {:noreply, socket}
  end

  @impl true
  def handle_info({:room_ready, room_id, topic}, socket) do
    IO.puts("🎉🎉🎉 ROOM READY RECEIVED! room_id=#{room_id}, topic=#{topic} 🎉🎉🎉")
    IO.puts("🔍 Player ID: #{socket.assigns.player_id}")
    IO.puts("🔍 Current room in socket: #{socket.assigns.current_room}")
    
    # Unsubscribe from current waiting room and personal topic
    if socket.assigns.current_room do
      IO.puts("🔄 Unsubscribing from waiting room: #{socket.assigns.current_room}")
      PubSub.unsubscribe(BobaTalkie.PubSub, "multiplayer_room:#{socket.assigns.current_room}")
    end
    
    IO.puts("🔄 Unsubscribing from personal topic: multiplayer_player:#{socket.assigns.player_id}")
    PubSub.unsubscribe(BobaTalkie.PubSub, "multiplayer_player:#{socket.assigns.player_id}")
    
    IO.puts("🔗 Subscribing to matched room: #{room_id}")
    PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_room:#{room_id}")
    
    # Room is ready with 2 players, redirect to multiplayer game
    params = %{
      "interface_language" => socket.assigns.interface_language,
      "learning_language" => socket.assigns.learning_language,
      "room_id" => room_id,
      "player_id" => socket.assigns.player_id
    }
    
    IO.puts("🚀 Redirecting to multiplayer game: /multiplayer_game/#{topic} with params: #{inspect(params)}")
    
    # Update the socket with the new room before redirecting
    socket = assign(socket, :current_room, room_id)
    
    {:noreply, push_navigate(socket, to: ~p"/multiplayer_game/#{topic}?#{params}")}
  end

  @impl true
  def handle_info({:room_update, _room_state}, socket) do
    # Handle room state updates if needed
    {:noreply, socket}
  end

  @impl true
  def handle_info({:player_joined, _player_id}, socket) do
    socket = put_flash(socket, :info, gettext("Another player joined the room!"))
    {:noreply, socket}
  end

  @impl true
  def handle_info({:player_left, _player_id}, socket) do
    socket = put_flash(socket, :info, gettext("The other player left the room"))
    {:noreply, socket}
  end

  @impl true  
  def handle_info(msg, socket) do
    IO.puts("🤷 Unhandled message in MultiplayerLobby: #{inspect(msg)}")
    {:noreply, socket}
  end

  # Private functions
  defp join_room(socket, room_id) do
    learning_language = socket.assigns.learning_language
    player_id = generate_player_id()
    
    case MultiplayerRoom.join_room(room_id, player_id, learning_language) do
      {:ok, _room_state} ->
        PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_room:#{room_id}")
        
        socket
        |> assign(:current_room, room_id)
        |> assign(:player_id, player_id)
        |> assign(:mode, :joining)
        |> assign(:waiting_for_match, true)
      
      {:error, :room_not_found} ->
        socket
        |> put_flash(:error, gettext("Room not found"))
        |> assign(:mode, :lobby)
      
      {:error, :language_mismatch} ->
        socket
        |> put_flash(:error, gettext("Language mismatch - you must learn the same language"))
        |> assign(:mode, :lobby)
      
      {:error, :room_full} ->
        socket
        |> put_flash(:error, gettext("Room is full"))
        |> assign(:mode, :lobby)
    end
  end

  defp get_or_create_player_id(session) do
    # Try to get existing player ID from session, otherwise generate new one
    case Map.get(session, "player_id") do
      nil -> generate_player_id()
      existing_id -> existing_id
    end
  end

  defp generate_player_id do
    :crypto.strong_rand_bytes(8) |> Base.url_encode64() |> binary_part(0, 8)
  end

  defp get_available_topics do
    ["introduction", "fruits", "numbers", "colors", "bakery", "animals", "restaurant", "family", "countries"]
  end

  defp topic_emoji(topic) do
    case topic do
      "introduction" -> "👋"
      "fruits" -> "🍎"
      "numbers" -> "1️⃣"
      "colors" -> "🌈"
      "bakery" -> "🥐"
      "animals" -> "🐶"
      "restaurant" -> "🍕"
      "family" -> "👨‍👩‍👧‍👦"
      "countries" -> "🇹🇼"
      _ -> "📚"
    end
  end

  defp topic_display_name(topic) do
    case topic do
      "introduction" -> gettext("Introduction")
      "fruits" -> gettext("Fruits")
      "numbers" -> gettext("Numbers")
      "colors" -> gettext("Colors")
      "bakery" -> gettext("Bakery")
      "animals" -> gettext("Animals")
      "restaurant" -> gettext("Restaurant")
      "family" -> gettext("Family")
      "countries" -> gettext("Countries")
      _ -> String.capitalize(topic)
    end
  end
end