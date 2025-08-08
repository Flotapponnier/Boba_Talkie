defmodule BobaTalkieWeb.GameLive.MovementHandlers do
  @moduledoc """
  Movement-related logic for GameLive.
  Handles player movement, command parsing, and collision detection.
  """

  alias BobaTalkie.Game.{World, Player}
  alias BobaTalkie.Utils.DebugLogger

  @doc """
  Process voice commands and execute game actions
  """
  def process_command(world, player, command, confidence) do
    DebugLogger.voice_debug("Processing voice command", %{command: command, confidence: confidence})
    
    # Update player stats
    new_player = Player.record_voice_command(player, command, confidence)
    
    # Parse and execute command
    case parse_voice_command(command) do
      {:move, direction} ->
        handle_movement(world, new_player, direction)
      
      :look ->
        handle_look_around(world, new_player)
      
      :help ->
        handle_help(world, new_player)
      
      :unknown ->
        handle_unknown_command(world, new_player, command)
    end
  end

  @doc """
  Handle test movement (for development)
  """
  def handle_test_move(socket, direction) do
    DebugLogger.game_debug("Test movement", %{direction: direction})
    
    direction_atom = String.to_atom(direction)
    
    case World.move_player(socket.assigns.world, direction_atom) do
      {:ok, new_world} ->
        new_player = Player.update_position(socket.assigns.player, new_world.player_pos)
        DebugLogger.game_debug("Movement successful", %{
          old_pos: socket.assigns.player.position,
          new_pos: new_world.player_pos
        })
        
        socket =
          socket
          |> assign(:world, new_world)
          |> assign(:player, new_player)
          |> add_game_message("Moved #{direction}")
        
        {:ok, socket}
      
      {:error, reason} ->
        DebugLogger.game_debug("Movement blocked", %{direction: direction, reason: reason})
        error_socket = add_game_message(socket, reason)
        {:error, error_socket}
    end
  end

  # Private functions

  defp handle_movement(world, player, direction) do
    case World.move_player(world, direction) do
      {:ok, new_world} ->
        updated_player = Player.update_position(player, new_world.player_pos)
        DebugLogger.game_debug("Voice movement successful", %{direction: direction, new_pos: new_world.player_pos})
        {new_world, updated_player, "You moved #{direction}"}
      
      {:error, reason} ->
        DebugLogger.game_debug("Voice movement blocked", %{direction: direction, reason: reason})
        {world, player, reason}
    end
  end

  defp handle_look_around(world, player) do
    surroundings = World.describe_surroundings(world)
    message = "You look around: " <> Enum.join(surroundings, ", ")
    DebugLogger.game_debug("Player looked around", %{surroundings: surroundings})
    {world, player, message}
  end

  defp handle_help(world, player) do
    help_text = """
    Voice commands:
    • "go north/south/east/west" or "go up/down/left/right" - Move around
    • "look around" - Describe surroundings
    • "help" - Show this help
    """
    DebugLogger.game_debug("Help command executed")
    {world, player, help_text}
  end

  defp handle_unknown_command(world, player, command) do
    message = "I didn't understand '#{command}'. Say 'help' for available commands."
    DebugLogger.game_debug("Unknown command", %{command: command})
    {world, player, message}
  end

  defp parse_voice_command(command) do
    # Clean the command: lowercase, trim, remove punctuation
    clean_command = command
    |> String.downcase()
    |> String.trim()
    |> String.replace(~r/[^\w\s]/, "")  # Remove punctuation
    |> String.trim()
    
    cond do
      # North/Up movement
      clean_command in ["go north", "move north", "north", "go up", "move up", "up"] -> {:move, :north}
      # South/Down movement  
      clean_command in ["go south", "move south", "south", "go down", "move down", "down"] -> {:move, :south}
      # East/Right movement
      clean_command in ["go east", "move east", "east", "go right", "move right", "right"] -> {:move, :east}
      # West/Left movement
      clean_command in ["go west", "move west", "west", "go left", "move left", "left"] -> {:move, :west}
      # Other commands
      clean_command in ["look around", "look", "describe"] -> :look
      clean_command in ["help", "commands", "what can i say"] -> :help
      true -> :unknown
    end
  end

  # Helper functions
  defp assign(socket, key, value) do
    Phoenix.Component.assign(socket, key, value)
  end

  defp add_game_message(socket, message) do
    new_messages = [message | socket.assigns.game_messages]
    |> Enum.take(10)  # Keep last 10 messages
    
    assign(socket, :game_messages, new_messages)
  end
end