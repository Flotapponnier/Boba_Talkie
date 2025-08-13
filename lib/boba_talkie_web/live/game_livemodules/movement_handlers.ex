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
      {:move, direction, steps} ->
        handle_movement(world, new_player, direction, steps)
      
      {:card_challenge} ->
        handle_card_challenge(world, new_player, command)
      
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

  defp handle_movement(world, player, direction, steps) do
    DebugLogger.game_debug("Attempting movement", %{direction: direction, steps: steps})
    
    case move_multiple_steps(world, direction, steps) do
      {:ok, new_world, actual_steps} ->
        updated_player = Player.update_position(player, new_world.player_pos)
        message = if actual_steps == steps do
          "You moved #{steps} step#{if steps > 1, do: "s"} #{direction}"
        else
          "You moved #{actual_steps} step#{if actual_steps > 1, do: "s"} #{direction} (blocked after #{actual_steps})"
        end
        DebugLogger.game_debug("Voice movement successful", %{
          direction: direction, 
          requested_steps: steps, 
          actual_steps: actual_steps,
          new_pos: new_world.player_pos
        })
        {new_world, updated_player, message}
      
      {:error, reason} ->
        DebugLogger.game_debug("Voice movement blocked", %{direction: direction, steps: steps, reason: reason})
        {world, player, reason}
    end
  end

  defp handle_look_around(world, player) do
    surroundings = World.describe_surroundings(world)
    message = "You look around: " <> Enum.join(surroundings, ", ")
    DebugLogger.game_debug("Player looked around", %{surroundings: surroundings})
    {world, player, message}
  end

  defp handle_card_challenge(world, player, voice_command) do
    case World.complete_card_challenge(world, voice_command) do
      {:ok, new_world, completed_card} ->
        updated_player = Player.increment_completed_challenges(player)
        message = "🎉 Card completed: '#{completed_card.template}'! #{get_completion_status(new_world)}"
        DebugLogger.game_debug("Card completed", %{template: completed_card.template})
        {new_world, updated_player, message}
      
      {:error, reason} ->
        DebugLogger.game_debug("Card challenge failed", %{reason: reason})
        {world, player, reason}
    end
  end

  defp handle_help(world, player) do
    help_text = """
    🎮 BobaTalkie Card Challenge Game:
    
    Movement Commands:
    • "north/south/east/west" or "up/down/left/right" - Move 1 step
    • "2 north", "3 right", "tree left" - Move multiple steps (1-3 max)
    • "move three times right" - Natural sentences work!
    
    Card Challenge System:
    1. Click a card to select it
    2. Stand on the correct object
    3. Say the complete sentence (e.g., "Eat the apple", "The banana is yellow")
    4. Complete all cards to win!
    
    Other Commands:
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
    # Clean the command: lowercase, trim, remove punctuation, normalize common speech recognition mistakes
    clean_command = command
    |> String.downcase()
    |> String.trim()
    |> String.replace(~r/[^\w\s]/, "")  # Remove punctuation
    |> String.replace(~r/\bto\b/, "two")  # Normalize "to" to "two" for numbers
    |> String.trim()
    
    cond do
      # Check for numbered movement commands anywhere in sentence (close together)
      String.match?(clean_command, ~r/(1|one)\s+.{0,20}\s*(north|up)|(north|up)\s+.{0,20}\s*(1|one)/) -> {:move, :north, 1}
      String.match?(clean_command, ~r/(2|two)\s+.{0,20}\s*(north|up)|(north|up)\s+.{0,20}\s*(2|two)/) -> {:move, :north, 2}
      String.match?(clean_command, ~r/(3|three|tree)\s+.{0,20}\s*(north|up)|(north|up)\s+.{0,20}\s*(3|three|tree)/) -> {:move, :north, 3}
      
      String.match?(clean_command, ~r/(1|one)\s+.{0,20}\s*(south|down)|(south|down)\s+.{0,20}\s*(1|one)/) -> {:move, :south, 1}
      String.match?(clean_command, ~r/(2|two)\s+.{0,20}\s*(south|down)|(south|down)\s+.{0,20}\s*(2|two)/) -> {:move, :south, 2}
      String.match?(clean_command, ~r/(3|three|tree)\s+.{0,20}\s*(south|down)|(south|down)\s+.{0,20}\s*(3|three|tree)/) -> {:move, :south, 3}
      
      String.match?(clean_command, ~r/(1|one)\s+.{0,20}\s*(east|right)|(east|right)\s+.{0,20}\s*(1|one)/) -> {:move, :east, 1}
      String.match?(clean_command, ~r/(2|two)\s+.{0,20}\s*(east|right)|(east|right)\s+.{0,20}\s*(2|two)/) -> {:move, :east, 2}
      String.match?(clean_command, ~r/(3|three|tree)\s+.{0,20}\s*(east|right)|(east|right)\s+.{0,20}\s*(3|three|tree)/) -> {:move, :east, 3}
      
      String.match?(clean_command, ~r/(1|one)\s+.{0,20}\s*(west|left)|(west|left)\s+.{0,20}\s*(1|one)/) -> {:move, :west, 1}
      String.match?(clean_command, ~r/(2|two)\s+.{0,20}\s*(west|left)|(west|left)\s+.{0,20}\s*(2|two)/) -> {:move, :west, 2}
      String.match?(clean_command, ~r/(3|three|tree)\s+.{0,20}\s*(west|left)|(west|left)\s+.{0,20}\s*(3|three|tree)/) -> {:move, :west, 3}
      
      # Check for tight number-direction patterns (original patterns for backward compatibility)
      String.match?(clean_command, ~r/\b(1|one)\s*(north|up)\b/) -> {:move, :north, 1}
      String.match?(clean_command, ~r/\b(2|two)\s*(north|up)\b/) -> {:move, :north, 2}
      String.match?(clean_command, ~r/\b(3|three|tree)\s*(north|up)\b/) -> {:move, :north, 3}
      String.match?(clean_command, ~r/\b(1|one)\s*(south|down)\b/) -> {:move, :south, 1}
      String.match?(clean_command, ~r/\b(2|two)\s*(south|down)\b/) -> {:move, :south, 2}
      String.match?(clean_command, ~r/\b(3|three|tree)\s*(south|down)\b/) -> {:move, :south, 3}
      String.match?(clean_command, ~r/\b(1|one)\s*(east|right)\b/) -> {:move, :east, 1}
      String.match?(clean_command, ~r/\b(2|two)\s*(east|right)\b/) -> {:move, :east, 2}
      String.match?(clean_command, ~r/\b(3|three|tree)\s*(east|right)\b/) -> {:move, :east, 3}
      String.match?(clean_command, ~r/\b(1|one)\s*(west|left)\b/) -> {:move, :west, 1}
      String.match?(clean_command, ~r/\b(2|two)\s*(west|left)\b/) -> {:move, :west, 2}
      String.match?(clean_command, ~r/\b(3|three|tree)\s*(west|left)\b/) -> {:move, :west, 3}
      
      # Check for single direction words (default to 1 move)
      String.contains?(clean_command, ["north", "up"]) -> {:move, :north, 1}
      String.contains?(clean_command, ["south", "down"]) -> {:move, :south, 1}
      String.contains?(clean_command, ["east", "right"]) -> {:move, :east, 1}
      String.contains?(clean_command, ["west", "left"]) -> {:move, :west, 1}
      
      # Check for card challenge phrases (full sentences containing topic-specific words)
      # Fruits and food
      String.contains?(clean_command, ["apple"]) or 
      String.contains?(clean_command, ["banana"]) or 
      String.contains?(clean_command, ["orange"]) or 
      String.contains?(clean_command, ["grape"]) or
      String.contains?(clean_command, ["strawberry"]) or
      String.contains?(clean_command, ["cherry"]) or
      String.contains?(clean_command, ["peach"]) or
      String.contains?(clean_command, ["pineapple"]) or
      String.contains?(clean_command, ["watermelon"]) or
      String.contains?(clean_command, ["lemon"]) or
      String.contains?(clean_command, ["avocado"]) or
      String.contains?(clean_command, ["coconut"]) or
      String.contains?(clean_command, ["mango"]) or
      String.contains?(clean_command, ["kiwi"]) or
      String.contains?(clean_command, ["tomato"]) or
      String.contains?(clean_command, ["carrot"]) or
      String.contains?(clean_command, ["bread"]) or
      String.contains?(clean_command, ["milk"]) or
      String.contains?(clean_command, ["cheese"]) or
      String.contains?(clean_command, ["egg"]) or
      String.contains?(clean_command, ["eat"]) or
      String.contains?(clean_command, ["this is"]) or
      # Colors
      String.contains?(clean_command, ["blue"]) or
      String.contains?(clean_command, ["red"]) or
      String.contains?(clean_command, ["green"]) or
      String.contains?(clean_command, ["yellow"]) or
      String.contains?(clean_command, ["purple"]) or
      String.contains?(clean_command, ["orange"]) or
      String.contains?(clean_command, ["pink"]) or
      String.contains?(clean_command, ["brown"]) or
      String.contains?(clean_command, ["black"]) or
      String.contains?(clean_command, ["white"]) or
      String.contains?(clean_command, ["gray"]) or
      String.contains?(clean_command, ["sky is"]) or
      String.contains?(clean_command, ["shirt is"]) or
      String.contains?(clean_command, ["grass is"]) or
      String.contains?(clean_command, ["sun is"]) or
      String.contains?(clean_command, ["rose is"]) or
      String.contains?(clean_command, ["night is"]) or
      String.contains?(clean_command, ["snow is"]) or
      String.contains?(clean_command, ["pumpkin is"]) or
      String.contains?(clean_command, ["elephant is"]) or
      String.contains?(clean_command, ["elephants are"]) or
      String.contains?(clean_command, ["elephants is"]) or
      String.contains?(clean_command, ["like the color"]) or
      String.contains?(clean_command, ["like the colour"]) or
      String.contains?(clean_command, ["favorite color"]) or
      String.contains?(clean_command, ["favourite color"]) or
      # Numbers
      String.contains?(clean_command, ["count to"]) or
      String.contains?(clean_command, ["i have"]) or
      String.contains?(clean_command, ["step"]) or
      String.contains?(clean_command, ["number"]) or
      String.contains?(clean_command, ["one"]) or
      String.contains?(clean_command, ["two"]) or
      String.contains?(clean_command, ["three"]) or
      String.contains?(clean_command, ["four"]) or
      String.contains?(clean_command, ["five"]) or
      String.contains?(clean_command, ["six"]) or
      String.contains?(clean_command, ["seven"]) or
      String.contains?(clean_command, ["eight"]) or
      String.contains?(clean_command, ["nine"]) or
      String.contains?(clean_command, ["ten"]) or
      String.contains?(clean_command, ["first"]) or
      String.contains?(clean_command, ["second"]) or
      String.contains?(clean_command, ["apples"]) or
      String.contains?(clean_command, ["favorite"]) or
      String.contains?(clean_command, ["forward"]) or
      # Introduction/greetings
      String.contains?(clean_command, ["hello"]) or
      String.contains?(clean_command, ["goodbye"]) or
      String.contains?(clean_command, ["my name"]) or
      String.contains?(clean_command, ["thank you"]) or
      String.contains?(clean_command, ["please"]) or
      String.contains?(clean_command, ["excuse me"]) or
      String.contains?(clean_command, ["sorry"]) or
      String.contains?(clean_command, ["nice to meet"]) or
      String.contains?(clean_command, ["how are you"]) or
      String.contains?(clean_command, ["i am fine"]) or
      String.contains?(clean_command, ["yes"]) or
      String.contains?(clean_command, ["no"]) or
      String.contains?(clean_command, ["see you later"]) or
      String.contains?(clean_command, ["where are you"]) or
      String.contains?(clean_command, ["come from"]) or
      String.contains?(clean_command, ["greet someone"]) or
      String.contains?(clean_command, ["helping me"]) or
      String.contains?(clean_command, ["sarah"]) or
      String.contains?(clean_command, ["answer is"]) or
      String.contains?(clean_command, ["meet you"]) -> {:card_challenge}
      
      # Other commands
      String.contains?(clean_command, ["look around"]) or String.contains?(clean_command, ["look"]) -> :look
      String.contains?(clean_command, ["help"]) -> :help
      true -> :unknown
    end
  end

  # Move player multiple steps in a direction, stopping on collision
  defp move_multiple_steps(world, direction, steps) when steps > 0 and steps <= 3 do
    move_multiple_steps_recursive(world, direction, steps, 0)
  end

  defp move_multiple_steps_recursive(world, _direction, 0, completed_steps) do
    {:ok, world, completed_steps}
  end

  defp move_multiple_steps_recursive(world, direction, remaining_steps, completed_steps) do
    case World.move_player(world, direction) do
      {:ok, new_world} ->
        # Successfully moved one step, continue with remaining
        move_multiple_steps_recursive(new_world, direction, remaining_steps - 1, completed_steps + 1)
      
      {:error, _reason} ->
        # Blocked, return current state with completed steps
        if completed_steps == 0 do
          {:error, "Cannot move #{direction} - blocked"}
        else
          {:ok, world, completed_steps}
        end
    end
  end

  # Helper functions
  defp get_completion_status(world) do
    {completed, total} = World.get_progress(world)
    if completed == total do
      "🏆 All cards completed! Game finished!"
    else
      "#{completed}/#{total} cards completed"
    end
  end

  defp assign(socket, key, value) do
    Phoenix.Component.assign(socket, key, value)
  end

  defp add_game_message(socket, message) do
    new_messages = [message | socket.assigns.game_messages]
    |> Enum.take(10)  # Keep last 10 messages
    
    assign(socket, :game_messages, new_messages)
  end
end