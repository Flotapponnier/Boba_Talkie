defmodule BobaTalkie.MultiplayerRoom do
  @moduledoc """
  GenServer for managing multiplayer game rooms and player matching.
  
  Handles:
  - Creating and managing game rooms
  - Language-based player matching
  - Private party room creation with shareable links
  - Player join/leave events
  - Room state synchronization
  """
  
  use GenServer
  alias Phoenix.PubSub
  require Logger

  # Client API

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @doc """
  Find an existing match or create a new room for random matchmaking.
  Players are matched by learning language.
  """
  def find_or_create_match(player_id, learning_language) do
    GenServer.call(__MODULE__, {:find_or_create_match, player_id, learning_language})
  end

  @doc """
  Create a private room with a specific topic that can be joined via link.
  """
  def create_private_room(host_id, learning_language, topic) do
    GenServer.call(__MODULE__, {:create_private_room, host_id, learning_language, topic})
  end

  @doc """
  Join an existing room by room_id.
  """
  def join_room(room_id, player_id, learning_language) do
    GenServer.call(__MODULE__, {:join_room, room_id, player_id, learning_language})
  end

  @doc """
  Leave a room.
  """
  def leave_room(room_id, player_id) do
    GenServer.call(__MODULE__, {:leave_room, room_id, player_id})
  end

  @doc """
  Get room state.
  """
  def get_room_state(room_id) do
    GenServer.call(__MODULE__, {:get_room_state, room_id})
  end

  @doc """
  Update player voice recording state (for mutex).
  """
  def set_recording_state(room_id, player_id, is_recording) do
    GenServer.call(__MODULE__, {:set_recording_state, room_id, player_id, is_recording})
  end

  # Server Implementation

  @impl true
  def init(_args) do
    # State structure:
    # %{
    #   rooms: %{
    #     room_id => %{
    #       id: room_id,
    #       type: :random | :private,
    #       learning_language: "fr",
    #       topic: "fruits" | :random,
    #       players: [player_id1, player_id2],
    #       status: :waiting | :ready | :in_game,
    #       host: player_id (for private rooms),
    #       recording_player: nil | player_id,
    #       created_at: DateTime
    #     }
    #   },
    #   waiting_players: %{learning_language => [player_id]}
    # }
    state = %{
      rooms: %{},
      waiting_players: %{}
    }
    
    # Schedule cleanup of old rooms
    schedule_cleanup()
    
    {:ok, state}
  end

  @impl true
  def handle_call({:find_or_create_match, player_id, learning_language}, _from, state) do
    Logger.info("🔍 MultiplayerRoom: Looking for match - player_id=#{player_id}, learning_language=#{learning_language}")
    Logger.info("🔍 Current waiting players: #{inspect(state.waiting_players)}")
    
    case find_waiting_player(state.waiting_players, learning_language, player_id) do
      {other_player_id, updated_waiting} ->
        # Match found, create room with random topic
        Logger.info("✅ Match found! player_id=#{player_id} matched with #{other_player_id}")
        topic = select_random_topic()
        room_id = generate_room_id()
        
        # Find each player's waiting room BEFORE we create the new room
        player1_room = find_player_waiting_room(state.rooms, player_id)
        player2_room = find_player_waiting_room(state.rooms, other_player_id)
        
        Logger.info("🔍 Player #{player_id} waiting room: #{player1_room}")
        Logger.info("🔍 Player #{other_player_id} waiting room: #{player2_room}")
        
        # Create a temporary waiting room for player1 if they don't have one
        temp_room_id = if player1_room == nil do
          temp_id = generate_room_id()
          Logger.info("🏗️ Creating temporary room #{temp_id} for player #{player_id}")
          temp_id
        else
          player1_room
        end
        
        room = %{
          id: room_id,
          type: :random,
          learning_language: learning_language,
          topic: topic,
          players: [player_id, other_player_id],
          status: :ready,
          host: nil,
          recording_player: nil,
          created_at: DateTime.utc_now()
        }
        
        updated_state = %{
          state |
          rooms: Map.put(state.rooms, room_id, room),
          waiting_players: updated_waiting
        }
        
        # Return the temp room ID to player1 so they can subscribe to it FIRST
        # We'll send the notifications in a separate process to ensure both players are subscribed
        spawn(fn ->
          # Wait a bit to ensure both players have subscribed to their topics
          Process.sleep(100)
          
          # Notify both players that room is ready
          Logger.info("📢 Notifying players room is ready: #{room_id} with topic #{topic}")
          
          # NEW APPROACH: Broadcast to both players using a dedicated player topic
          # This ensures BOTH players receive the notification regardless of their waiting room status
          Logger.info("📢 Broadcasting to player #{player_id} via topic: multiplayer_player:#{player_id}")
          case PubSub.broadcast(BobaTalkie.PubSub, "multiplayer_player:#{player_id}", {:room_ready, room_id, topic}) do
            :ok -> Logger.info("✅ Successfully broadcasted to player #{player_id}")
            {:error, reason} -> Logger.error("❌ Failed to broadcast to player #{player_id}: #{inspect(reason)}")
          end
          
          Logger.info("📢 Broadcasting to player #{other_player_id} via topic: multiplayer_player:#{other_player_id}")
          case PubSub.broadcast(BobaTalkie.PubSub, "multiplayer_player:#{other_player_id}", {:room_ready, room_id, topic}) do
            :ok -> Logger.info("✅ Successfully broadcasted to player #{other_player_id}")
            {:error, reason} -> Logger.error("❌ Failed to broadcast to player #{other_player_id}: #{inspect(reason)}")
          end
          
          # Also broadcast to the new room topic for good measure
          notify_players_room_ready(room_id, topic, [player_id, other_player_id])
        end)
        
        # Return the temp room ID to player1 so they can subscribe to it
        {:reply, {:ok, temp_room_id}, updated_state}
        
      nil ->
        # No match found, add to waiting list
        Logger.info("⏳ No match found, adding #{player_id} to waiting list for #{learning_language}")
        updated_waiting = add_waiting_player(state.waiting_players, learning_language, player_id)
        updated_state = %{state | waiting_players: updated_waiting}
        
        # Create a temporary room for the waiting player
        room_id = generate_room_id()
        room = %{
          id: room_id,
          type: :random,
          learning_language: learning_language,
          topic: nil,
          players: [player_id],
          status: :waiting,
          host: nil,
          recording_player: nil,
          created_at: DateTime.utc_now()
        }
        
        updated_state = %{updated_state | rooms: Map.put(updated_state.rooms, room_id, room)}
        
        Logger.info("📝 Updated waiting players: #{inspect(updated_state.waiting_players)}")
        {:reply, {:ok, room_id}, updated_state}
    end
  end

  @impl true
  def handle_call({:create_private_room, host_id, learning_language, topic}, _from, state) do
    room_id = generate_room_id()
    
    room = %{
      id: room_id,
      type: :private,
      learning_language: learning_language,
      topic: topic,
      players: [host_id],
      status: :waiting,
      host: host_id,
      recording_player: nil,
      created_at: DateTime.utc_now()
    }
    
    updated_state = %{state | rooms: Map.put(state.rooms, room_id, room)}
    
    {:reply, {:ok, room_id}, updated_state}
  end

  @impl true
  def handle_call({:join_room, room_id, player_id, learning_language}, _from, state) do
    case Map.get(state.rooms, room_id) do
      nil ->
        {:reply, {:error, :room_not_found}, state}
        
      %{learning_language: room_language} = _room when room_language != learning_language ->
        {:reply, {:error, :language_mismatch}, state}
        
      %{players: players} = _room when length(players) >= 2 ->
        {:reply, {:error, :room_full}, state}
        
      %{players: players} = room ->
        updated_players = [player_id | players]
        updated_room = %{room | players: updated_players, status: :ready}
        updated_state = %{state | rooms: Map.put(state.rooms, room_id, updated_room)}
        
        # Notify existing players
        notify_players_joined(room_id, player_id, players)
        
        # If room is now full, notify all players it's ready
        if length(updated_players) == 2 do
          notify_players_room_ready(room_id, room.topic, updated_players)
        end
        
        {:reply, {:ok, updated_room}, updated_state}
    end
  end

  @impl true
  def handle_call({:leave_room, room_id, player_id}, _from, state) do
    case Map.get(state.rooms, room_id) do
      nil ->
        {:reply, :ok, state}
        
      %{players: players} = room ->
        updated_players = List.delete(players, player_id)
        
        # Remove from waiting list if applicable
        updated_waiting = remove_from_waiting(state.waiting_players, room.learning_language, player_id)
        
        updated_state = if length(updated_players) == 0 do
          # Remove empty room
          %{state | rooms: Map.delete(state.rooms, room_id), waiting_players: updated_waiting}
        else
          # Update room
          updated_room = %{room | players: updated_players, status: :waiting}
          notify_players_left(room_id, player_id, updated_players)
          %{state | rooms: Map.put(state.rooms, room_id, updated_room), waiting_players: updated_waiting}
        end
        
        {:reply, :ok, updated_state}
    end
  end

  @impl true
  def handle_call({:get_room_state, room_id}, _from, state) do
    room = Map.get(state.rooms, room_id)
    {:reply, room, state}
  end

  @impl true
  def handle_call({:set_recording_state, room_id, player_id, is_recording}, _from, state) do
    case Map.get(state.rooms, room_id) do
      nil ->
        {:reply, {:error, :room_not_found}, state}
        
      room ->
        updated_recording_player = if is_recording, do: player_id, else: nil
        updated_room = %{room | recording_player: updated_recording_player}
        updated_state = %{state | rooms: Map.put(state.rooms, room_id, updated_room)}
        
        # Notify other players about recording state change
        notify_recording_state_change(room_id, player_id, is_recording, room.players)
        
        {:reply, :ok, updated_state}
    end
  end

  @impl true
  def handle_info(:cleanup_old_rooms, state) do
    cutoff_time = DateTime.add(DateTime.utc_now(), -30, :minute)
    
    {rooms_to_remove, updated_rooms} = 
      Enum.split_with(state.rooms, fn {_id, room} ->
        DateTime.compare(room.created_at, cutoff_time) == :lt
      end)
    
    # Log cleanup
    if length(rooms_to_remove) > 0 do
      Logger.info("Cleaned up #{length(rooms_to_remove)} old multiplayer rooms")
    end
    
    updated_state = %{state | rooms: Map.new(updated_rooms)}
    schedule_cleanup()
    
    {:noreply, updated_state}
  end

  # Private helper functions

  defp find_waiting_player(waiting_players, learning_language, exclude_player_id) do
    case Map.get(waiting_players, learning_language, []) do
      [] ->
        nil
        
      [^exclude_player_id | rest] ->
        case rest do
          [] -> nil
          [other_player | remaining] ->
            updated_waiting = Map.put(waiting_players, learning_language, remaining)
            {other_player, updated_waiting}
        end
        
      [other_player | rest] ->
        updated_list = List.delete(rest, exclude_player_id)
        updated_waiting = Map.put(waiting_players, learning_language, updated_list)
        {other_player, updated_waiting}
    end
  end

  defp add_waiting_player(waiting_players, learning_language, player_id) do
    current_list = Map.get(waiting_players, learning_language, [])
    updated_list = [player_id | current_list] |> Enum.uniq()
    Map.put(waiting_players, learning_language, updated_list)
  end

  defp remove_from_waiting(waiting_players, learning_language, player_id) do
    current_list = Map.get(waiting_players, learning_language, [])
    updated_list = List.delete(current_list, player_id)
    Map.put(waiting_players, learning_language, updated_list)
  end

  defp generate_room_id do
    :crypto.strong_rand_bytes(8) 
    |> Base.url_encode64() 
    |> String.replace(~r/[+\/=]/, "")
    |> String.slice(0, 8)
    |> String.upcase()
  end

  defp select_random_topic do
    topics = ["introduction", "fruits", "numbers", "colors", "bakery", "animals", "restaurant", "family", "countries"]
    Enum.random(topics)
  end

  defp notify_players_room_ready(room_id, topic, _player_ids) do
    message = {:room_ready, room_id, topic}
    topic_name = "multiplayer_room:#{room_id}"
    
    Logger.info("📢 Broadcasting to topic: #{topic_name}, message: #{inspect(message)}")
    
    # Broadcast once to the room topic - all subscribers will receive it
    case PubSub.broadcast(BobaTalkie.PubSub, topic_name, message) do
      :ok -> 
        Logger.info("✅ Broadcast successful")
      {:error, reason} -> 
        Logger.error("❌ Broadcast failed: #{inspect(reason)}")
    end
  end

  defp notify_on_waiting_room_topics(rooms, player_ids, message) do
    # Find rooms where these players might be waiting and broadcast to their topics
    Enum.each(rooms, fn {waiting_room_id, room} ->
      if room.status == :waiting && Enum.any?(player_ids, fn id -> id in room.players end) do
        topic_name = "multiplayer_room:#{waiting_room_id}"
        Logger.info("📢 Also broadcasting to waiting room topic: #{topic_name}")
        PubSub.broadcast(BobaTalkie.PubSub, topic_name, message)
      end
    end)
  end

  defp notify_individual_players(rooms, player_ids, message) do
    # Find each player's individual waiting room and broadcast to them
    Enum.each(player_ids, fn player_id ->
      # Find the room where this player is waiting
      case Enum.find(rooms, fn {_room_id, room} -> 
        room.status == :waiting && player_id in room.players 
      end) do
        {waiting_room_id, _room} ->
          topic_name = "multiplayer_room:#{waiting_room_id}"
          Logger.info("📢 Broadcasting to player #{player_id}'s waiting room: #{topic_name}")
          PubSub.broadcast(BobaTalkie.PubSub, topic_name, message)
        nil ->
          Logger.info("📢 No waiting room found for player #{player_id}")
      end
    end)
  end

  defp notify_players_joined(room_id, new_player_id, existing_player_ids) do
    Enum.each(existing_player_ids, fn _player_id ->
      PubSub.broadcast(
        BobaTalkie.PubSub,
        "multiplayer_room:#{room_id}",
        {:player_joined, new_player_id}
      )
    end)
  end

  defp notify_players_left(room_id, left_player_id, remaining_player_ids) do
    Enum.each(remaining_player_ids, fn _player_id ->
      PubSub.broadcast(
        BobaTalkie.PubSub,
        "multiplayer_room:#{room_id}",
        {:player_left, left_player_id}
      )
    end)
  end

  defp notify_recording_state_change(room_id, recording_player_id, is_recording, all_player_ids) do
    other_players = List.delete(all_player_ids, recording_player_id)
    
    Enum.each(other_players, fn _player_id ->
      PubSub.broadcast(
        BobaTalkie.PubSub,
        "multiplayer_room:#{room_id}",
        {:recording_state_changed, recording_player_id, is_recording}
      )
    end)
  end

  defp find_player_waiting_room(rooms, player_id) do
    case Enum.find(rooms, fn {_room_id, room} -> 
      room.status == :waiting && player_id in room.players 
    end) do
      {room_id, _room} -> room_id
      nil -> nil
    end
  end

  defp schedule_cleanup do
    Process.send_after(self(), :cleanup_old_rooms, :timer.minutes(5))
  end
end