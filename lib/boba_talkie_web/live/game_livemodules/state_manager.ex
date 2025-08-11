defmodule BobaTalkieWeb.GameLive.StateManager do
  @moduledoc """
  State management utilities for GameLive.
  Handles socket assigns, game state updates, and state validation.
  """

  alias BobaTalkie.Game.{World, Player}
  alias BobaTalkie.Utils.DebugLogger

  @doc """
  Initialize game state for a new session
  """
  def initialize_game_state(socket, topic \\ "fruits") do
    DebugLogger.live_debug("GameLive mounting with topic: #{topic}")
    
    # Initialize game state with topic-specific content
    world = World.new(6, 6, topic)
    player = Player.new()
    
    DebugLogger.game_debug("Game initialized", %{
      world_size: "#{world.width}x#{world.height}",
      player_pos: player.position
    })
    
    topic_title = case topic do
      "introduction" -> "Self-Introduction"
      "fruits" -> "Fruits & Food"
      _ -> "Game"
    end
    
    welcome_message = case topic do
      "introduction" -> "Welcome to Self-Introduction! Practice greeting phrases and introducing yourself."
      "fruits" -> "Welcome to Fruits & Food! Learn about delicious fruits and food vocabulary."
      _ -> "Welcome to BobaTalkie! Say 'help' for commands."
    end

    socket
    |> assign(:page_title, "BobaTalkie - #{topic_title}")
    |> assign(:topic, topic)
    |> assign(:world, world)
    |> assign(:player, player)
    |> assign(:game_messages, [welcome_message])
    |> assign(:listening, false)
    |> assign(:last_command, nil)
    |> assign(:interim_text, nil)
    |> assign(:text_input_mode, false)
  end

  @doc """
  Update game state with new world and player data
  """
  def update_game_state(socket, world, player, message \\ nil) do
    socket = 
      socket
      |> assign(:world, world)
      |> assign(:player, player)
    
    if message do
      add_game_message(socket, message)
    else
      socket
    end
  end

  @doc """
  Add a message to the game message history
  """
  def add_game_message(socket, message) do
    new_messages = [message | socket.assigns.game_messages]
    |> Enum.take(10)  # Keep last 10 messages
    
    assign(socket, :game_messages, new_messages)
  end

  @doc """
  Update voice-related state
  """
  def update_voice_state(socket, opts \\ []) do
    socket = if Keyword.has_key?(opts, :listening) do
      assign(socket, :listening, Keyword.get(opts, :listening))
    else
      socket
    end

    socket = if Keyword.has_key?(opts, :interim_text) do
      assign(socket, :interim_text, Keyword.get(opts, :interim_text))
    else
      socket
    end

    socket = if Keyword.has_key?(opts, :last_command) do
      assign(socket, :last_command, Keyword.get(opts, :last_command))
    else
      socket
    end

    socket
  end

  @doc """
  Validate game state integrity
  """
  def validate_game_state(socket) do
    world = socket.assigns.world
    player = socket.assigns.player

    cond do
      is_nil(world) ->
        DebugLogger.error("Invalid game state: world is nil", nil, :game)
        {:error, "Game world not initialized"}
      
      is_nil(player) ->
        DebugLogger.error("Invalid game state: player is nil", nil, :game)
        {:error, "Player not initialized"}
      
      not valid_player_position?(world, player.position) ->
        DebugLogger.error("Invalid game state: player position out of bounds", %{position: player.position}, :game)
        {:error, "Player position invalid"}
      
      true ->
        {:ok, socket}
    end
  end

  @doc """
  Reset game state to initial values
  """
  def reset_game_state(socket) do
    DebugLogger.game_debug("Resetting game state")
    initialize_game_state(socket)
  end

  @doc """
  Get current game statistics
  """
  def get_game_stats(socket) do
    player = socket.assigns.player
    world = socket.assigns.world
    
    %{
      commands_spoken: player.stats.commands_spoken,
      pronunciation_score: player.stats.pronunciation_score,
      items_collected: length(player.inventory),
      current_position: player.position,
      world_size: {world.width, world.height},
      messages_count: length(socket.assigns.game_messages)
    }
  end

  # Private functions

  defp valid_player_position?(world, {x, y}) do
    x >= 0 and x < world.width and y >= 0 and y < world.height
  end

  defp assign(socket, key, value) do
    Phoenix.Component.assign(socket, key, value)
  end
end