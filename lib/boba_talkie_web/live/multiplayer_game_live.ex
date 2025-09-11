defmodule BobaTalkieWeb.MultiplayerGameLive do
  use BobaTalkieWeb, :live_view
  require Logger
  import BobaTalkieWeb.LanguageSelector
  alias BobaTalkieWeb.LanguageSession
  alias BobaTalkie.MultiplayerRoom
  alias Phoenix.PubSub
  
  # Import modular components from single-player game
  alias BobaTalkieWeb.GameLive.{StateManager, VoiceHandlers}
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(%{"topic" => topic} = params, session, socket) do
    interface_language = LanguageSession.get_interface_language(params, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(params, session, socket.assigns)
    room_id = Map.get(params, "room_id")
    
    if !room_id do
      {:ok, redirect(socket, to: "/multiplayer")}
    else
      # Get room state
      case MultiplayerRoom.get_room_state(room_id) do
        nil ->
          socket = socket |> put_flash(:error, gettext("Room not found")) 
          {:ok, redirect(socket, to: "/multiplayer")}
          
        room_state ->
          # Subscribe to room updates
          PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_room:#{room_id}")
          PubSub.subscribe(BobaTalkie.PubSub, "multiplayer_game:#{room_id}")
          
          # Initialize game state using the same StateManager as single-player
          # Get player_id from params or generate new one
          player_id = Map.get(params, "player_id") || generate_player_id()
          
          socket = 
            socket
            |> LanguageSession.set_locale_and_assign(interface_language, learning_language)
            |> StateManager.initialize_game_state(topic, learning_language)
            |> assign(:multiplayer_mode, true)
            |> assign(:room_id, room_id)
            |> assign(:room_state, room_state)
            |> assign(:player_id, player_id)
            |> assign(:other_player_id, get_other_player_id(room_state.players, player_id))
            |> assign(:is_recording_blocked, false)
            |> assign(:other_player_recording, false)
            |> assign(:video_enabled, true)
            |> assign(:audio_enabled, true)
            |> assign(:other_player_connected, true)
            |> assign(:other_player_video, true)
            |> assign(:other_player_audio, true)
            |> assign(:page_title, "BobaTalkie - Multiplayer Game: #{String.capitalize(topic)}")
          
          {:ok, socket}
      end
    end
  end

  # Voice recording events with multiplayer mutex
  @impl true
  def handle_event("start_listening", _params, socket) do
    room_id = socket.assigns.room_id
    player_id = get_player_id(socket)
    
    # Check if other player is recording
    if socket.assigns.is_recording_blocked do
      socket = put_flash(socket, :info, gettext("Please wait - your partner is speaking"))
      {:noreply, socket}
    else
      # Set recording state in room
      MultiplayerRoom.set_recording_state(room_id, player_id, true)
      
      # Set listening state
      socket = assign(socket, :listening, true)
      {:noreply, socket}
    end
  end

  @impl true
  def handle_event("stop_listening", _params, socket) do
    room_id = socket.assigns.room_id
    player_id = get_player_id(socket)
    
    # Release recording state in room
    MultiplayerRoom.set_recording_state(room_id, player_id, false)
    
    # Stop listening state
    socket = assign(socket, :listening, false)
    {:noreply, socket}
  end

  @impl true
  def handle_event("voice_command", %{"command" => command, "confidence" => confidence}, socket) do
    require Logger
    Logger.info("MultiplayerGameLive: Processing voice_command: #{command}")
    
    try do
      # Store last command for display - same as single player
      socket = assign(socket, :last_command, command)
      
      # Process voice command using the same logic as single-player
      socket = VoiceHandlers.handle_voice_result(
        socket, 
        command, 
        confidence,
        socket.assigns.world, 
        socket.assigns.player
      )
      
      # Broadcast game state update to other player
      broadcast_game_state_update(socket)
      
      Logger.info("MultiplayerGameLive: voice_command processed successfully: #{command}")
      {:noreply, socket}
    rescue
      e ->
        Logger.error("MultiplayerGameLive: ERROR in voice_command handler: #{inspect(e)} for command: #{command}")
        socket = StateManager.add_game_message(socket, "Voice command error: #{command}")
        {:noreply, socket}
    end
  end
  
  @impl true
  def handle_event("voice_interim", %{"text" => text}, socket) do
    socket = VoiceHandlers.handle_voice_interim(socket, text)
    {:noreply, socket}
  end
  
  @impl true
  def handle_event("voice_error", %{"error" => error}, socket) do
    socket = VoiceHandlers.handle_voice_error(socket, error)
    {:noreply, socket}
  end

  @impl true
  def handle_event("voice_audio", audio_params, socket) do
    # Handle MediaRecorder audio data for Brave browser (like single-player)
    case VoiceHandlers.handle_voice_audio(socket, audio_params, self()) do
      {:ok, updated_socket} -> 
        # Broadcast game state update after voice processing
        broadcast_game_state_update(updated_socket)
        {:noreply, updated_socket}
      {:error, error_socket} -> 
        {:noreply, error_socket}
    end
  end

  @impl true
  def handle_event("start_deepgram_stream", _params, socket) do
    socket = VoiceHandlers.handle_start_deepgram_stream(socket, self())
    {:noreply, socket}
  end

  @impl true
  def handle_event("stop_deepgram_stream", _params, socket) do
    # Stop Deepgram stream - handled by VoiceCapture hook directly
    {:noreply, socket}
  end

  # WebRTC Signaling Events
  @impl true
  def handle_event("join_webrtc_room", _params, socket) do
    room_id = socket.assigns.room_id
    player_id = get_player_id(socket)
    
    # Notify other players in the room that this player has joined WebRTC
    PubSub.broadcast(
      BobaTalkie.PubSub,
      "multiplayer_game:#{room_id}",
      {:webrtc_peer_joined, player_id}
    )
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("webrtc_offer", %{"room_id" => room_id, "offer" => offer}, socket) do
    player_id = get_player_id(socket)
    
    # Broadcast offer to other players
    PubSub.broadcast(
      BobaTalkie.PubSub,
      "multiplayer_game:#{room_id}",
      {:webrtc_offer, offer, player_id}
    )
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("webrtc_answer", %{"room_id" => room_id, "answer" => answer}, socket) do
    player_id = get_player_id(socket)
    
    # Broadcast answer to other players
    PubSub.broadcast(
      BobaTalkie.PubSub,
      "multiplayer_game:#{room_id}",
      {:webrtc_answer, answer, player_id}
    )
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("webrtc_ice_candidate", %{"room_id" => room_id, "candidate" => candidate}, socket) do
    player_id = get_player_id(socket)
    
    # Broadcast ICE candidate to other players
    PubSub.broadcast(
      BobaTalkie.PubSub,
      "multiplayer_game:#{room_id}",
      {:webrtc_ice_candidate, candidate, player_id}
    )
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("webrtc_connected", _params, socket) do
    # WebRTC connection established
    socket = assign(socket, :webrtc_connected, true)
    {:noreply, socket}
  end

  @impl true
  def handle_event("webrtc_disconnected", _params, socket) do
    # WebRTC connection lost
    socket = assign(socket, :webrtc_connected, false)
    {:noreply, socket}
  end

  @impl true
  def handle_event("webrtc_error", %{"error" => error}, socket) do
    socket = StateManager.add_game_message(socket, "Video connection error: #{error}")
    {:noreply, socket}
  end

  @impl true
  def handle_event("leave_webrtc_room", _params, socket) do
    # Handle WebRTC cleanup
    {:noreply, socket}
  end

  # Video/Audio controls
  @impl true
  def handle_event("toggle_video", _params, socket) do
    current_state = socket.assigns.video_enabled
    new_video_state = !current_state
    Logger.info("🎥 Toggle video: #{current_state} -> #{new_video_state}")
    
    socket = assign(socket, :video_enabled, new_video_state)
    
    # Send toggle event to WebRTC hook
    socket = push_event(socket, "toggle_local_video", %{enabled: new_video_state})
    
    # Broadcast video state to other player
    broadcast_media_state(socket, :video, new_video_state)
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle_audio", _params, socket) do
    current_state = socket.assigns.audio_enabled
    new_audio_state = !current_state
    Logger.info("🎤 Toggle audio: #{current_state} -> #{new_audio_state}")
    
    socket = assign(socket, :audio_enabled, new_audio_state)
    
    # Send toggle event to WebRTC hook
    socket = push_event(socket, "toggle_local_audio", %{enabled: new_audio_state})
    
    # Broadcast audio state to other player
    broadcast_media_state(socket, :audio, new_audio_state)
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("leave_game", _params, socket) do
    room_id = socket.assigns.room_id
    player_id = get_player_id(socket)
    
    # Leave the multiplayer room
    MultiplayerRoom.leave_room(room_id, player_id)
    
    # Redirect back to lobby
    {:noreply, redirect(socket, to: "/multiplayer")}
  end

  # Card description toggle handler - same as single player
  @impl true
  def handle_event("toggle_card_description", %{"card_id" => card_id}, socket) do
    current_expanded = socket.assigns[:expanded_descriptions] || MapSet.new()
    
    updated_expanded = if MapSet.member?(current_expanded, card_id) do
      MapSet.delete(current_expanded, card_id)
    else
      MapSet.put(current_expanded, card_id)
    end
    
    socket = assign(socket, :expanded_descriptions, updated_expanded)
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

  # Room updates
  @impl true
  def handle_info({:recording_state_changed, recording_player_id, is_recording}, socket) do
    # Update recording block state based on other player's recording
    other_player_id = socket.assigns.other_player_id
    
    socket = if recording_player_id == other_player_id do
      assign(socket, :is_recording_blocked, is_recording)
      |> assign(:other_player_recording, is_recording)
    else
      socket
    end
    
    {:noreply, socket}
  end

  @impl true
  def handle_info({:player_left, left_player_id}, socket) do
    if left_player_id == socket.assigns.other_player_id do
      socket = 
        socket 
        |> put_flash(:info, gettext("Your partner left the game"))
        |> assign(:other_player_connected, false)
      {:noreply, socket}
    else
      {:noreply, socket}
    end
  end

  @impl true
  def handle_info({:game_state_update, updated_state}, socket) do
    # Receive game state updates from other player
    # Update shared game elements (like completed cards, world state)
    socket = merge_game_state_update(socket, updated_state)
    {:noreply, socket}
  end

  @impl true
  def handle_info({:media_state_update, player_id, media_type, enabled}, socket) do
    if player_id == socket.assigns.other_player_id do
      case media_type do
        :video -> 
          socket = assign(socket, :other_player_video, enabled)
          {:noreply, socket}
        :audio -> 
          socket = assign(socket, :other_player_audio, enabled)
          {:noreply, socket}
        _ ->
          {:noreply, socket}
      end
    else
      {:noreply, socket}
    end
  end

  # WebRTC signaling handlers
  @impl true
  def handle_info({:webrtc_peer_joined, player_id}, socket) do
    # Another player joined WebRTC, send this event to the WebRTC hook
    socket = push_event(socket, "webrtc_peer_joined", %{player_id: player_id})
    {:noreply, socket}
  end

  @impl true
  def handle_info({:webrtc_offer, offer, from_player}, socket) do
    # Received WebRTC offer from another player
    socket = push_event(socket, "webrtc_offer", %{offer: offer, from_player: from_player})
    {:noreply, socket}
  end

  @impl true
  def handle_info({:webrtc_answer, answer, from_player}, socket) do
    # Received WebRTC answer from another player
    socket = push_event(socket, "webrtc_answer", %{answer: answer, from_player: from_player})
    {:noreply, socket}
  end

  @impl true
  def handle_info({:webrtc_ice_candidate, candidate, from_player}, socket) do
    # Received ICE candidate from another player
    socket = push_event(socket, "webrtc_ice_candidate", %{candidate: candidate, from_player: from_player})
    {:noreply, socket}
  end

  # Private helper functions

  defp get_other_player_id(players, current_player_id) do
    Enum.find(players, fn id -> id != current_player_id end)
  end

  defp get_player_id(socket) do
    # Generate or retrieve player ID - could be from session or room state
    socket.assigns[:player_id] || generate_player_id()
  end

  defp generate_player_id do
    :crypto.strong_rand_bytes(8) |> Base.url_encode64() |> binary_part(0, 8)
  end

  defp broadcast_game_state_update(socket) do
    room_id = socket.assigns.room_id
    player_id = get_player_id(socket)
    
    # Extract relevant game state to broadcast
    game_state = %{
      world: socket.assigns.world,
      player: socket.assigns.player,
      cards: socket.assigns.cards || socket.assigns.world.cards,
      completed_cards: socket.assigns.completed_cards || [],
      current_feedback: socket.assigns.current_feedback,
      game_messages: socket.assigns.game_messages || [],
      player_id: player_id
    }
    
    PubSub.broadcast(
      BobaTalkie.PubSub,
      "multiplayer_game:#{room_id}",
      {:game_state_update, game_state}
    )
  end

  defp broadcast_media_state(socket, media_type, enabled) do
    room_id = socket.assigns.room_id
    player_id = get_player_id(socket)
    
    PubSub.broadcast(
      BobaTalkie.PubSub,
      "multiplayer_game:#{room_id}",
      {:media_state_update, player_id, media_type, enabled}
    )
  end

  defp merge_game_state_update(socket, updated_state) do
    # Only update if this is from the other player (not from ourselves)
    current_player_id = get_player_id(socket)
    
    if updated_state.player_id != current_player_id do
      # Merge shared game elements like completed cards and world items
      # But keep our own player position
      updated_world = if updated_state.world do
        # Update world cards and items, but preserve our player position
        current_world = socket.assigns.world
        %{updated_state.world | player_pos: current_world.player_pos}
      else
        socket.assigns.world
      end
      
      socket
      |> assign(:world, updated_world)
      |> assign(:other_player_feedback, updated_state.current_feedback)
      |> StateManager.add_game_message("Partner: #{updated_state.current_feedback || "made a move"}")
    else
      # This update is from ourselves, ignore to prevent loops
      socket
    end
  end


end