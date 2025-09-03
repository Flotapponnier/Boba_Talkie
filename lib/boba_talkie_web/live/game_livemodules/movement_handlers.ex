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
  def process_command(world, player, command, confidence, learning_language, interface_language) do
    require Logger
    Logger.info("🔥 MovementHandlers: DEBUT process_command - #{command}")
    DebugLogger.voice_debug("Processing voice command", %{command: command, confidence: confidence, learning_language: learning_language})
    
    try do
      # Update player stats
      new_player = Player.record_voice_command(player, command, confidence)
      
      # Parse and execute command with learning language
      case parse_voice_command(command, learning_language) do
      {:move, direction, steps} ->
        handle_movement(world, new_player, direction, steps)
      
      {:card_challenge} ->
        handle_card_challenge(world, new_player, command, learning_language)
      
      :look ->
        handle_look_around(world, new_player, interface_language)
      
      :help ->
        handle_help(world, new_player)
      
      :unknown ->
        Logger.info("🔥 MovementHandlers: Command UNKNOWN - #{command}")
        result = handle_unknown_command(world, new_player, command)
        Logger.info("🔥 MovementHandlers: FIN process_command - UNKNOWN result: #{inspect(result)}")
        result
      end
    rescue
      e ->
        Logger.error("🚨 MovementHandlers: ERREUR CRITIQUE in process_command - #{command}")
        Logger.error("🚨 MovementHandlers: Error: #{inspect(e)}")
        Logger.error("🚨 MovementHandlers: Stacktrace: #{Exception.format_stacktrace(__STACKTRACE__)}")
        DebugLogger.error("Error in process_command", %{error: inspect(e), command: command}, :voice)
        {world, player, "Voice processing error: #{command}"}
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

  defp handle_look_around(world, player, interface_language) do
    surroundings = World.describe_surroundings(world, interface_language)
    # Translate "You look around" to interface language
    look_text = case interface_language do
      "fr" -> "Vous regardez autour:"
      "es" -> "Miras alrededor:"
      "zh" -> "你环顾四周:"
      "ru" -> "Вы осматриваетесь:"
      "ja" -> "周りを見回す:"
      "it" -> "Ti guardi intorno:"
      "ar" -> "تنظر حولك:"
      "pt" -> "Você olha ao redor:"
      _ -> "You look around:"
    end
    message = look_text <> " " <> Enum.join(surroundings, ", ")
    DebugLogger.game_debug("Player looked around", %{surroundings: surroundings})
    {world, player, message}
  end

  defp handle_card_challenge(world, player, voice_command, learning_language) do
    case World.complete_card_challenge_auto(world, voice_command, learning_language) do
      {:ok, new_world, completed_card} ->
        updated_player = Player.increment_completed_challenges(player)
        message = "Card completed: '#{completed_card.template}'! #{get_completion_status(new_world)}"
        DebugLogger.game_debug("Card completed", %{template: completed_card.template})
        {new_world, updated_player, message}
      
      {:error, reason} ->
        DebugLogger.game_debug("Card challenge failed", %{reason: reason})
        {world, player, reason}
    end
  end

  defp handle_help(world, player) do
    help_text = """
    BobaTalkie Card Challenge Game:
    
    Quick Movement Commands:
    • "north", "south", "east", "west" - Move 1 step
    • "up", "down", "left", "right" - Alternative directions
    • "3 right", "2 down", "1 left" - Move multiple steps (1-3 max)
    
    Card Challenge System:
    1. Stand on any object
    2. Say the complete sentence (e.g., "Eat the apple", "The banana is yellow")
    3. Cards auto-complete when you say the right phrase!
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

  defp parse_voice_command(command, learning_language) do
    require Logger
    Logger.info("🔥 MovementHandlers: DEBUT parse_voice_command - '#{command}' (#{learning_language})")
    
    # Clean the command: lowercase, trim, remove punctuation, normalize common speech recognition mistakes
    clean_command = command
    |> String.downcase()
    |> String.trim()
    |> String.replace(~r/[.!?,:;]/, "")  # Only remove basic punctuation, preserve accented characters
    |> String.replace(~r/\bto\b/, "two")  # Normalize "to" to "two" for numbers
    |> String.trim()
    
    Logger.info("🔥 MovementHandlers: Command cleaned: '#{clean_command}'")
    
    cond do
      # HIGHEST PRIORITY: Check for card challenge phrases first (before movement)
      is_multilingual_card_sentence?(clean_command, learning_language) ->
        Logger.info("🔥 MovementHandlers: Detected potential card sentence: #{clean_command}")
        {:card_challenge}
        
      # Priority: Simple single-word directional commands (multilingual)
      clean_command in get_direction_words(:north, learning_language) -> 
        Logger.info("🔥 MovementHandlers: Match NORTH direction")
        {:move, :north, 1}
      clean_command in get_direction_words(:south, learning_language) -> 
        Logger.info("🔥 MovementHandlers: Match SOUTH direction")
        {:move, :south, 1}
      clean_command in get_direction_words(:east, learning_language) -> 
        Logger.info("🔥 MovementHandlers: Match EAST direction")
        {:move, :east, 1}
      clean_command in get_direction_words(:west, learning_language) -> 
        Logger.info("🔥 MovementHandlers: Match WEST direction")
        {:move, :west, 1}
      
      # French numbered commands with "fois" (times)
      String.match?(clean_command, ~r/\b(à gauche|gauche)\s+(1|un|une)\s+fois\b/) or String.match?(clean_command, ~r/\b(1|un|une)\s+fois\s+(à gauche|gauche)\b/) -> {:move, :west, 1}
      String.match?(clean_command, ~r/\b(à gauche|gauche)\s+(2|deux)\s+fois\b/) or String.match?(clean_command, ~r/\b(2|deux)\s+fois\s+(à gauche|gauche)\b/) -> {:move, :west, 2}
      String.match?(clean_command, ~r/\b(à gauche|gauche)\s+(3|trois)\s+fois\b/) or String.match?(clean_command, ~r/\b(3|trois)\s+fois\s+(à gauche|gauche)\b/) -> {:move, :west, 3}
      
      String.match?(clean_command, ~r/\b(à droite|droite)\s+(1|un|une)\s+fois\b/) or String.match?(clean_command, ~r/\b(1|un|une)\s+fois\s+(à droite|droite)\b/) -> {:move, :east, 1}
      String.match?(clean_command, ~r/\b(à droite|droite)\s+(2|deux)\s+fois\b/) or String.match?(clean_command, ~r/\b(2|deux)\s+fois\s+(à droite|droite)\b/) -> {:move, :east, 2}
      String.match?(clean_command, ~r/\b(à droite|droite)\s+(3|trois)\s+fois\b/) or String.match?(clean_command, ~r/\b(3|trois)\s+fois\s+(à droite|droite)\b/) -> {:move, :east, 3}
      
      String.match?(clean_command, ~r/\b(en haut|haut|nord)\s+(1|un|une)\s+fois\b/) or String.match?(clean_command, ~r/\b(1|un|une)\s+fois\s+(en haut|haut|nord)\b/) -> {:move, :north, 1}
      String.match?(clean_command, ~r/\b(en haut|haut|nord)\s+(2|deux)\s+fois\b/) or String.match?(clean_command, ~r/\b(2|deux)\s+fois\s+(en haut|haut|nord)\b/) -> {:move, :north, 2}
      String.match?(clean_command, ~r/\b(en haut|haut|nord)\s+(3|trois)\s+fois\b/) or String.match?(clean_command, ~r/\b(3|trois)\s+fois\s+(en haut|haut|nord)\b/) -> {:move, :north, 3}
      
      String.match?(clean_command, ~r/\b(en bas|bas|sud)\s+(1|un|une)\s+fois\b/) or String.match?(clean_command, ~r/\b(1|un|une)\s+fois\s+(en bas|bas|sud)\b/) -> {:move, :south, 1}
      String.match?(clean_command, ~r/\b(en bas|bas|sud)\s+(2|deux)\s+fois\b/) or String.match?(clean_command, ~r/\b(2|deux)\s+fois\s+(en bas|bas|sud)\b/) -> {:move, :south, 2}
      String.match?(clean_command, ~r/\b(en bas|bas|sud)\s+(3|trois)\s+fois\b/) or String.match?(clean_command, ~r/\b(3|trois)\s+fois\s+(en bas|bas|sud)\b/) -> {:move, :south, 3}

      # Check for "va en [direction]" pattern (French: "go to [direction]") - more strict
      String.match?(clean_command, ~r/\bva\s+(en\s+)?(bas|sud)\b/) -> {:move, :south, 1}
      String.match?(clean_command, ~r/\bva\s+(en\s+)?(haut|nord)\b/) -> {:move, :north, 1}
      String.match?(clean_command, ~r/\bva\s+(en\s+)?(droite)\b/) -> {:move, :east, 1}
      String.match?(clean_command, ~r/\bva\s+(en\s+)?(gauche)\b/) -> {:move, :west, 1}
      String.match?(clean_command, ~r/\bva\s+(à\s+l')?(est)\b/) -> {:move, :east, 1}
      String.match?(clean_command, ~r/\bva\s+(à\s+l')?(ouest)\b/) -> {:move, :west, 1}
      
      # Multilingual numbered movement commands
      parse_numbered_movement(clean_command, learning_language) != :unknown -> parse_numbered_movement(clean_command, learning_language)
      
      # Check for single direction words (only for current learning language)
      contains_direction_word?(clean_command, :north, learning_language) -> {:move, :north, 1}
      contains_direction_word?(clean_command, :south, learning_language) -> {:move, :south, 1}
      contains_direction_word?(clean_command, :east, learning_language) -> {:move, :east, 1}
      contains_direction_word?(clean_command, :west, learning_language) -> {:move, :west, 1}
      
      # Check for multilingual card challenge phrases (language-specific detection only)
      is_multilingual_card_sentence?(clean_command, learning_language) -> {:card_challenge}
      
      # Other commands (multilingual)
      is_look_command?(clean_command, learning_language) -> :look
      is_help_command?(clean_command, learning_language) -> :help
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
      "All cards completed! Game finished!"
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

  # Get direction words for different languages
  defp get_direction_words(:north, learning_language) do
    case learning_language do
      "en" -> ["north", "up"]
      "fr" -> ["nord", "haut"]
      "es" -> ["norte", "arriba"]
      "zh" -> ["北", "上", "bei", "shang"]
      "ru" -> ["север", "вверх", "sever", "vverkh"]
      "ja" -> ["北", "上", "kita", "ue"]
      "it" -> ["nord", "su"]
      "ar" -> ["شمال", "فوق", "shamal", "fawq"]
      "pt" -> ["norte", "cima"]
      _ -> ["north", "up"]
    end
  end

  defp get_direction_words(:south, learning_language) do
    case learning_language do
      "en" -> ["south", "down"]
      "fr" -> ["sud", "bas"]
      "es" -> ["sur", "abajo"]
      "zh" -> ["南", "下", "nan", "xia"]
      "ru" -> ["юг", "вниз", "yug", "vniz"]
      "ja" -> ["南", "下", "minami", "shita"]
      "it" -> ["sud", "giù"]
      "ar" -> ["جنوب", "تحت", "janub", "taht"]
      "pt" -> ["sul", "baixo"]
      _ -> ["south", "down"]
    end
  end

  defp get_direction_words(:east, learning_language) do
    case learning_language do
      "en" -> ["east", "right"]
      "fr" -> ["droite"]  # Removed "est" to avoid conflict with French verb "est" (is)
      "es" -> ["este", "derecha"]
      "zh" -> ["东", "右", "dong", "you"]
      "ru" -> ["восток", "вправо", "vostok", "vpravo"]
      "ja" -> ["東", "右", "higashi", "migi"]
      "it" -> ["destra"]  # Removed "est" to avoid conflict with Italian verb "est" (is)
      "ar" -> ["شرق", "يمين", "sharq", "yameen"]
      "pt" -> ["leste", "direita"]
      _ -> ["east", "right"]
    end
  end

  defp get_direction_words(:west, learning_language) do
    case learning_language do
      "en" -> ["west", "left"]
      "fr" -> ["ouest", "gauche"]
      "es" -> ["oeste", "izquierda"]
      "zh" -> ["西", "左", "xi", "zuo"]
      "ru" -> ["запад", "влево", "zapad", "vlevo"]
      "ja" -> ["西", "左", "nishi", "hidari"]
      "it" -> ["ovest", "sinistra"]
      "ar" -> ["غرب", "يسار", "gharb", "yasar"]
      "pt" -> ["oeste", "esquerda"]
      _ -> ["west", "left"]
    end
  end

  # Check if command contains any direction word for the current learning language
  defp contains_direction_word?(command, direction, learning_language) do
    direction_words = get_direction_words(direction, learning_language)
    Enum.any?(direction_words, fn word -> String.contains?(command, word) end)
  end

  # Parse numbered movement commands for all languages
  defp parse_numbered_movement(command, learning_language) do
    case learning_language do
      "fr" -> parse_french_numbered_movement(command)
      "es" -> parse_spanish_numbered_movement(command)
      "zh" -> parse_chinese_numbered_movement(command)
      "ru" -> parse_russian_numbered_movement(command)
      "ja" -> parse_japanese_numbered_movement(command)
      "it" -> parse_italian_numbered_movement(command)
      "ar" -> parse_arabic_numbered_movement(command)
      "pt" -> parse_portuguese_numbered_movement(command)
      _ -> :unknown
    end
  end

  defp parse_french_numbered_movement(command) do
    require Logger
    cond do
      # Pattern: "2 droites" / "3 gauches" etc. (number + direction plural)
      String.match?(command, ~r/\b(1|un|une)\s+(gauches?)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|deux)\s+(gauches?)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|trois)\s+(gauches?)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|un|une)\s+(droites?)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|deux)\s+(droites?)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|trois)\s+(droites?)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|un|une)\s+(hauts?|nords?)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|deux)\s+(hauts?|nords?)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|trois)\s+(hauts?|nords?)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|un|une)\s+(bas|suds?)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|deux)\s+(bas|suds?)\b/) -> 
        Logger.info("🔥 MovementHandlers: MATCH DEUX BAS detected!")
        {:move, :south, 2}
      String.match?(command, ~r/\b(3|trois)\s+(bas|suds?)\b/) -> {:move, :south, 3}
      
      # "à gauche 3 fois" or "3 fois à gauche"
      String.match?(command, ~r/\b(à gauche|gauche)\s+(1|un|une)\s+fois\b/) or String.match?(command, ~r/\b(1|un|une)\s+fois\s+(à gauche|gauche)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(à gauche|gauche)\s+(2|deux)\s+fois\b/) or String.match?(command, ~r/\b(2|deux)\s+fois\s+(à gauche|gauche)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(à gauche|gauche)\s+(3|trois)\s+fois\b/) or String.match?(command, ~r/\b(3|trois)\s+fois\s+(à gauche|gauche)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(à droite|droite)\s+(1|un|une)\s+fois\b/) or String.match?(command, ~r/\b(1|un|une)\s+fois\s+(à droite|droite)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(à droite|droite)\s+(2|deux)\s+fois\b/) or String.match?(command, ~r/\b(2|deux)\s+fois\s+(à droite|droite)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(à droite|droite)\s+(3|trois)\s+fois\b/) or String.match?(command, ~r/\b(3|trois)\s+fois\s+(à droite|droite)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(en haut|haut|nord)\s+(1|un|une)\s+fois\b/) or String.match?(command, ~r/\b(1|un|une)\s+fois\s+(en haut|haut|nord)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(en haut|haut|nord)\s+(2|deux)\s+fois\b/) or String.match?(command, ~r/\b(2|deux)\s+fois\s+(en haut|haut|nord)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(en haut|haut|nord)\s+(3|trois)\s+fois\b/) or String.match?(command, ~r/\b(3|trois)\s+fois\s+(en haut|haut|nord)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(en bas|bas|sud)\s+(1|un|une)\s+fois\b/) or String.match?(command, ~r/\b(1|un|une)\s+fois\s+(en bas|bas|sud)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(en bas|bas|sud)\s+(2|deux)\s+fois\b/) or String.match?(command, ~r/\b(2|deux)\s+fois\s+(en bas|bas|sud)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(en bas|bas|sud)\s+(3|trois)\s+fois\b/) or String.match?(command, ~r/\b(3|trois)\s+fois\s+(en bas|bas|sud)\b/) -> {:move, :south, 3}
      
      true -> :unknown
    end
  end

  defp parse_spanish_numbered_movement(command) do
    cond do
      # Pattern: "2 derechas" / "3 izquierdas" etc.
      String.match?(command, ~r/\b(1|uno|una)\s+(izquierdas?)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|dos)\s+(izquierdas?)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|tres)\s+(izquierdas?)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|uno|una)\s+(derechas?)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|dos)\s+(derechas?)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|tres)\s+(derechas?)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|uno|una)\s+(arriba|nortes?)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|dos)\s+(arriba|nortes?)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|tres)\s+(arriba|nortes?)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|uno|una)\s+(abajo|sures?)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|dos)\s+(abajo|sures?)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|tres)\s+(abajo|sures?)\b/) -> {:move, :south, 3}
      
      # Traditional "vez/veces" pattern
      String.match?(command, ~r/\b(izquierda|oeste)\s+(1|uno|una)\s+(vez|veces)\b/) or String.match?(command, ~r/\b(1|uno|una)\s+(vez|veces)\s+(izquierda|oeste)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(izquierda|oeste)\s+(2|dos)\s+(veces)\b/) or String.match?(command, ~r/\b(2|dos)\s+(veces)\s+(izquierda|oeste)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(izquierda|oeste)\s+(3|tres)\s+(veces)\b/) or String.match?(command, ~r/\b(3|tres)\s+(veces)\s+(izquierda|oeste)\b/) -> {:move, :west, 3}
      true -> :unknown
    end
  end

  defp parse_chinese_numbered_movement(command) do
    cond do
      # Pattern: "2个左" / "3个右" etc.
      String.match?(command, ~r/\b(1|一|yi)\s*个?\s*(左|zuo)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|二|er)\s*个?\s*(左|zuo)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|三|san)\s*个?\s*(左|zuo)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|一|yi)\s*个?\s*(右|you)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|二|er)\s*个?\s*(右|you)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|三|san)\s*个?\s*(右|you)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|一|yi)\s*个?\s*(上|shang|北|bei)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|二|er)\s*个?\s*(上|shang|北|bei)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|三|san)\s*个?\s*(上|shang|北|bei)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|一|yi)\s*个?\s*(下|xia|南|nan)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|二|er)\s*个?\s*(下|xia|南|nan)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|三|san)\s*个?\s*(下|xia|南|nan)\b/) -> {:move, :south, 3}
      
      # Traditional "次" pattern
      String.match?(command, ~r/\b(左|zuo)\s+(1|一|yi)\s+(次|ci)\b/) or String.match?(command, ~r/\b(1|一|yi)\s+(次|ci)\s+(左|zuo)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(左|zuo)\s+(2|二|er)\s+(次|ci)\b/) or String.match?(command, ~r/\b(2|二|er)\s+(次|ci)\s+(左|zuo)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(左|zuo)\s+(3|三|san)\s+(次|ci)\b/) or String.match?(command, ~r/\b(3|三|san)\s+(次|ci)\s+(左|zuo)\b/) -> {:move, :west, 3}
      true -> :unknown
    end
  end

  defp parse_russian_numbered_movement(command) do
    cond do
      # West (влево/запад)
      String.match?(command, ~r/\b(влево|vlevo)\s+(1|один|odin)\s+(раз|raz)\b/) or String.match?(command, ~r/\b(1|один|odin)\s+(раз|raz)\s+(влево|vlevo)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(влево|vlevo)\s+(2|два|dva)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(2|два|dva)\s+(раза|raza)\s+(влево|vlevo)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(влево|vlevo)\s+(3|три|tri)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(3|три|tri)\s+(раза|raza)\s+(влево|vlevo)\b/) -> {:move, :west, 3}
      
      # East (вправо/восток)  
      String.match?(command, ~r/\b(вправо|vpravo)\s+(1|один|odin)\s+(раз|raz)\b/) or String.match?(command, ~r/\b(1|один|odin)\s+(раз|raz)\s+(вправо|vpravo)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(вправо|vpravo)\s+(2|два|dva)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(2|два|dva)\s+(раза|raza)\s+(вправо|vpravo)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(вправо|vpravo)\s+(3|три|tri)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(3|три|tri)\s+(раза|raza)\s+(вправо|vpravo)\b/) -> {:move, :east, 3}
      
      # North (вверх/север)
      String.match?(command, ~r/\b(вверх|север|vverkh|sever)\s+(1|один|odin)\s+(раз|raz)\b/) or String.match?(command, ~r/\b(1|один|odin)\s+(раз|raz)\s+(вверх|север|vverkh|sever)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(вверх|север|vverkh|sever)\s+(2|два|dva)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(2|два|dva)\s+(раза|raza)\s+(вверх|север|vverkh|sever)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(вверх|север|vverkh|sever)\s+(3|три|tri)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(3|три|tri)\s+(раза|raza)\s+(вверх|север|vverkh|sever)\b/) -> {:move, :north, 3}
      
      # South (вниз/юг)
      String.match?(command, ~r/\b(вниз|юг|vniz|yug)\s+(1|один|odin)\s+(раз|raz)\b/) or String.match?(command, ~r/\b(1|один|odin)\s+(раз|raz)\s+(вниз|юг|vniz|yug)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(вниз|юг|vniz|yug)\s+(2|два|dva)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(2|два|dva)\s+(раза|raza)\s+(вниз|юг|vniz|yug)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(вниз|юг|vniz|yug)\s+(3|три|tri)\s+(раза|raza)\b/) or String.match?(command, ~r/\b(3|три|tri)\s+(раза|raza)\s+(вниз|юг|vniz|yug)\b/) -> {:move, :south, 3}
      
      # Simple numbered patterns: "три север", "два вправо" 
      String.match?(command, ~r/\b(1|один|odin)\s+(влево|zapад|vlevo|zapad)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|два|dva)\s+(влево|запад|vlevo|zapad)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|три|tri)\s+(влево|запад|vlevo|zapad)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|один|odin)\s+(вправо|восток|vpravo|vostok)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|два|dva)\s+(вправо|восток|vpravo|vostok)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|три|tri)\s+(вправо|восток|vpravo|vostok)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|один|odin)\s+(вверх|север|vverkh|sever)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|два|dva)\s+(вверх|север|vverkh|sever)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|три|tri)\s+(вверх|север|vverkh|sever)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|один|odin)\s+(вниз|юг|vniz|yug)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|два|dva)\s+(вниз|юг|vniz|yug)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|три|tri)\s+(вниз|юг|vniz|yug)\b/) -> {:move, :south, 3}
      
      true -> :unknown
    end
  end

  defp parse_japanese_numbered_movement(command) do
    cond do
      # West (左|西)
      String.match?(command, ~r/\b(左|西|hidari|nishi)\s+(1|一|ichi)\s+(回|kai)\b/) or String.match?(command, ~r/\b(1|一|ichi)\s+(回|kai)\s+(左|西|hidari|nishi)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(左|西|hidari|nishi)\s+(2|二|ni)\s+(回|kai)\b/) or String.match?(command, ~r/\b(2|二|ni)\s+(回|kai)\s+(左|西|hidari|nishi)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(左|西|hidari|nishi)\s+(3|三|san)\s+(回|kai)\b/) or String.match?(command, ~r/\b(3|三|san)\s+(回|kai)\s+(左|西|hidari|nishi)\b/) -> {:move, :west, 3}
      
      # East (右|東)
      String.match?(command, ~r/\b(右|東|migi|higashi)\s+(1|一|ichi)\s+(回|kai)\b/) or String.match?(command, ~r/\b(1|一|ichi)\s+(回|kai)\s+(右|東|migi|higashi)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(右|東|migi|higashi)\s+(2|二|ni)\s+(回|kai)\b/) or String.match?(command, ~r/\b(2|二|ni)\s+(回|kai)\s+(右|東|migi|higashi)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(右|東|migi|higashi)\s+(3|三|san)\s+(回|kai)\b/) or String.match?(command, ~r/\b(3|三|san)\s+(回|kai)\s+(右|東|migi|higashi)\b/) -> {:move, :east, 3}
      
      # North (上|北)
      String.match?(command, ~r/\b(上|北|ue|kita)\s+(1|一|ichi)\s+(回|kai)\b/) or String.match?(command, ~r/\b(1|一|ichi)\s+(回|kai)\s+(上|北|ue|kita)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(上|北|ue|kita)\s+(2|二|ni)\s+(回|kai)\b/) or String.match?(command, ~r/\b(2|二|ni)\s+(回|kai)\s+(上|北|ue|kita)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(上|北|ue|kita)\s+(3|三|san)\s+(回|kai)\b/) or String.match?(command, ~r/\b(3|三|san)\s+(回|kai)\s+(上|北|ue|kita)\b/) -> {:move, :north, 3}
      
      # South (下|南)
      String.match?(command, ~r/\b(下|南|shita|minami)\s+(1|一|ichi)\s+(回|kai)\b/) or String.match?(command, ~r/\b(1|一|ichi)\s+(回|kai)\s+(下|南|shita|minami)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(下|南|shita|minami)\s+(2|二|ni)\s+(回|kai)\b/) or String.match?(command, ~r/\b(2|二|ni)\s+(回|kai)\s+(下|南|shita|minami)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(下|南|shita|minami)\s+(3|三|san)\s+(回|kai)\b/) or String.match?(command, ~r/\b(3|三|san)\s+(回|kai)\s+(下|南|shita|minami)\b/) -> {:move, :south, 3}
      
      # Simple numbered patterns: "三北", "二右"
      String.match?(command, ~r/\b(1|一|ichi)\s+(左|西|hidari|nishi)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|二|ni)\s+(左|西|hidari|nishi)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|三|san)\s+(左|西|hidari|nishi)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|一|ichi)\s+(右|東|migi|higashi)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|二|ni)\s+(右|東|migi|higashi)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|三|san)\s+(右|東|migi|higashi)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|一|ichi)\s+(上|北|ue|kita)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|二|ni)\s+(上|北|ue|kita)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|三|san)\s+(上|北|ue|kita)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|一|ichi)\s+(下|南|shita|minami)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|二|ni)\s+(下|南|shita|minami)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|三|san)\s+(下|南|shita|minami)\b/) -> {:move, :south, 3}
      
      true -> :unknown
    end
  end

  defp parse_italian_numbered_movement(command) do
    cond do
      # West (sinistra/ovest)
      String.match?(command, ~r/\b(sinistra|ovest)\s+(1|uno|una)\s+(volta|volte)\b/) or String.match?(command, ~r/\b(1|uno|una)\s+(volta|volte)\s+(sinistra|ovest)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(sinistra|ovest)\s+(2|due)\s+(volte)\b/) or String.match?(command, ~r/\b(2|due)\s+(volte)\s+(sinistra|ovest)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(sinistra|ovest)\s+(3|tre)\s+(volte)\b/) or String.match?(command, ~r/\b(3|tre)\s+(volte)\s+(sinistra|ovest)\b/) -> {:move, :west, 3}
      
      # East (destra)
      String.match?(command, ~r/\b(destra)\s+(1|uno|una)\s+(volta|volte)\b/) or String.match?(command, ~r/\b(1|uno|una)\s+(volta|volte)\s+(destra)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(destra)\s+(2|due)\s+(volte)\b/) or String.match?(command, ~r/\b(2|due)\s+(volte)\s+(destra)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(destra)\s+(3|tre)\s+(volte)\b/) or String.match?(command, ~r/\b(3|tre)\s+(volte)\s+(destra)\b/) -> {:move, :east, 3}
      
      # North (su/nord)
      String.match?(command, ~r/\b(su|nord)\s+(1|uno|una)\s+(volta|volte)\b/) or String.match?(command, ~r/\b(1|uno|una)\s+(volta|volte)\s+(su|nord)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(su|nord)\s+(2|due)\s+(volte)\b/) or String.match?(command, ~r/\b(2|due)\s+(volte)\s+(su|nord)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(su|nord)\s+(3|tre)\s+(volte)\b/) or String.match?(command, ~r/\b(3|tre)\s+(volte)\s+(su|nord)\b/) -> {:move, :north, 3}
      
      # South (giù/sud)
      String.match?(command, ~r/\b(giù|sud)\s+(1|uno|una)\s+(volta|volte)\b/) or String.match?(command, ~r/\b(1|uno|una)\s+(volta|volte)\s+(giù|sud)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(giù|sud)\s+(2|due)\s+(volte)\b/) or String.match?(command, ~r/\b(2|due)\s+(volte)\s+(giù|sud)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(giù|sud)\s+(3|tre)\s+(volte)\b/) or String.match?(command, ~r/\b(3|tre)\s+(volte)\s+(giù|sud)\b/) -> {:move, :south, 3}
      
      # Simple numbered patterns: "2 destra", "3 sinistra"
      String.match?(command, ~r/\b(1|uno|una)\s+(sinistre?)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|due)\s+(sinistre?)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|tre)\s+(sinistre?)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|uno|una)\s+(destre?)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|due)\s+(destre?)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|tre)\s+(destre?)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|uno|una)\s+(su|nords?)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|due)\s+(su|nords?)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|tre)\s+(su|nords?)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|uno|una)\s+(giù|suds?)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|due)\s+(giù|suds?)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|tre)\s+(giù|suds?)\b/) -> {:move, :south, 3}
      
      true -> :unknown
    end
  end

  defp parse_arabic_numbered_movement(command) do
    cond do
      # West (يسار/غرب)
      String.match?(command, ~r/\b(يسار|غرب|yasar|gharb)\s+(1|واحد|wahid)\s+(مرة|marra)\b/) or String.match?(command, ~r/\b(1|واحد|wahid)\s+(مرة|marra)\s+(يسار|غرب|yasar|gharb)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(يسار|غرب|yasar|gharb)\s+(2|اثنان|ithnan)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(مرات|marrat)\s+(يسار|غرب|yasar|gharb)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(يسار|غرب|yasar|gharb)\s+(3|ثلاثة|thalatha)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(مرات|marrat)\s+(يسار|غرب|yasar|gharb)\b/) -> {:move, :west, 3}
      
      # East (يمين/شرق)
      String.match?(command, ~r/\b(يمين|شرق|yameen|sharq)\s+(1|واحد|wahid)\s+(مرة|marra)\b/) or String.match?(command, ~r/\b(1|واحد|wahid)\s+(مرة|marra)\s+(يمين|شرق|yameen|sharq)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(يمين|شرق|yameen|sharq)\s+(2|اثنان|ithnan)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(مرات|marrat)\s+(يمين|شرق|yameen|sharq)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(يمين|شرق|yameen|sharq)\s+(3|ثلاثة|thalatha)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(مرات|marrat)\s+(يمين|شرق|yameen|sharq)\b/) -> {:move, :east, 3}
      
      # North (فوق/شمال)
      String.match?(command, ~r/\b(فوق|شمال|fawq|shamal)\s+(1|واحد|wahid)\s+(مرة|marra)\b/) or String.match?(command, ~r/\b(1|واحد|wahid)\s+(مرة|marra)\s+(فوق|شمال|fawq|shamal)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(فوق|شمال|fawq|shamal)\s+(2|اثنان|ithnan)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(مرات|marrat)\s+(فوق|شمال|fawq|shamal)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(فوق|شمال|fawq|shamal)\s+(3|ثلاثة|thalatha)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(مرات|marrat)\s+(فوق|شمال|fawq|shamal)\b/) -> {:move, :north, 3}
      
      # South (تحت/جنوب)
      String.match?(command, ~r/\b(تحت|جنوب|taht|janub)\s+(1|واحد|wahid)\s+(مرة|marra)\b/) or String.match?(command, ~r/\b(1|واحد|wahid)\s+(مرة|marra)\s+(تحت|جنوب|taht|janub)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(تحت|جنوب|taht|janub)\s+(2|اثنان|ithnan)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(مرات|marrat)\s+(تحت|جنوب|taht|janub)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(تحت|جنوب|taht|janub)\s+(3|ثلاثة|thalatha)\s+(مرات|marrat)\b/) or String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(مرات|marrat)\s+(تحت|جنوب|taht|janub)\b/) -> {:move, :south, 3}
      
      # Simple numbered patterns: "ثلاثة شمال", "اثنان يمين"
      String.match?(command, ~r/\b(1|واحد|wahid)\s+(يسار|غرب|yasar|gharb)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(يسار|غرب|yasar|gharb)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(يسار|غرب|yasar|gharb)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|واحد|wahid)\s+(يمين|شرق|yameen|sharq)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(يمين|شرق|yameen|sharq)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(يمين|شرق|yameen|sharq)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|واحد|wahid)\s+(فوق|شمال|fawq|shamal)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(فوق|شمال|fawq|shamal)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(فوق|شمال|fawq|shamal)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|واحد|wahid)\s+(تحت|جنوب|taht|janub)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|اثنان|ithnan)\s+(تحت|جنوب|taht|janub)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|ثلاثة|thalatha)\s+(تحت|جنوب|taht|janub)\b/) -> {:move, :south, 3}
      
      true -> :unknown
    end
  end

  defp parse_portuguese_numbered_movement(command) do
    require Logger
    cond do
      # Pattern: "2 direitas" / "3 esquerdas" etc.
      String.match?(command, ~r/\b(1|um|uma)\s+(esquerdas?)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(2|dois|duas)\s+(esquerdas?)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(3|três)\s+(esquerdas?)\b/) -> {:move, :west, 3}
      
      String.match?(command, ~r/\b(1|um|uma)\s+(direitas?)\b/) -> {:move, :east, 1}
      String.match?(command, ~r/\b(2|dois|duas)\s+(direitas?)\b/) -> {:move, :east, 2}
      String.match?(command, ~r/\b(3|três)\s+(direitas?)\b/) -> {:move, :east, 3}
      
      String.match?(command, ~r/\b(1|um|uma)\s+(cimas?|nortes?)\b/) -> {:move, :north, 1}
      String.match?(command, ~r/\b(2|dois|duas)\s+(cimas?|nortes?)\b/) -> {:move, :north, 2}
      String.match?(command, ~r/\b(3|três)\s+(cimas?|nortes?)\b/) -> {:move, :north, 3}
      
      String.match?(command, ~r/\b(1|um|uma)\s+(baixos?|suis?)\b/) -> {:move, :south, 1}
      String.match?(command, ~r/\b(2|dois|duas)\s+(baixos?|suis?)\b/) -> {:move, :south, 2}
      String.match?(command, ~r/\b(3|três)\s+(baixos?|suis?)\b/) -> {:move, :south, 3}
      
      # Traditional "vez/vezes" pattern
      String.match?(command, ~r/\b(esquerda|oeste)\s+(1|um|uma)\s+(vez|vezes)\b/) or String.match?(command, ~r/\b(1|um|uma)\s+(vez|vezes)\s+(esquerda|oeste)\b/) -> {:move, :west, 1}
      String.match?(command, ~r/\b(esquerda|oeste)\s+(2|dois|duas)\s+(vezes)\b/) or String.match?(command, ~r/\b(2|dois|duas)\s+(vezes)\s+(esquerda|oeste)\b/) -> {:move, :west, 2}
      String.match?(command, ~r/\b(esquerda|oeste)\s+(3|três)\s+(vezes)\b/) or String.match?(command, ~r/\b(3|três)\s+(vezes)\s+(esquerda|oeste)\b/) -> {:move, :west, 3}
      true -> 
        Logger.info("🔥 MovementHandlers: Command not recognized - #{command}")
        :unknown
    end
  end
  
  # Check if the command is a card challenge sentence (learning language only)
  defp is_multilingual_card_sentence?(command, learning_language) do
    case learning_language do
      "en" ->
        # English card sentence patterns - only when learning English
        String.contains?(command, "is") or String.contains?(command, "the") or 
        String.starts_with?(command, "my ") or String.starts_with?(command, "eat") or String.starts_with?(command, "i like") or
        String.starts_with?(command, "i want") or String.starts_with?(command, "i have") or
        String.starts_with?(command, "how much") or String.starts_with?(command, "count") or String.starts_with?(command, "say ")
      
      "fr" ->
        # French card sentence patterns
        String.contains?(command, "est") or String.starts_with?(command, "j'aime") or 
        String.starts_with?(command, "mon ") or String.starts_with?(command, "ma ") or String.starts_with?(command, "mes ") or
        String.starts_with?(command, "mange") or String.starts_with?(command, "cette") or String.starts_with?(command, "ce ") or
        String.starts_with?(command, "je veux") or String.starts_with?(command, "j'ai") or 
        String.starts_with?(command, "combien") or String.starts_with?(command, "compte") or
        String.starts_with?(command, "dites") or String.starts_with?(command, "ravi") or
        String.starts_with?(command, "voici") or String.starts_with?(command, "il mio") or String.starts_with?(command, "merci") or
        String.contains?(command, "saute") or String.contains?(command, "fidèle") or String.contains?(command, "rapidement") or
        String.contains?(command, "jungle") or String.contains?(command, "apporte") or
        String.contains?(command, "a des") or String.contains?(command, "rayures") or String.contains?(command, "roi de") or
        String.contains?(command, "se balance") or String.contains?(command, "dort") or String.contains?(command, "mange du") or
        String.contains?(command, "bambou") or String.contains?(command, "arbres")
      
      "es" ->
        # Spanish card sentence patterns
        String.contains?(command, "es") or String.starts_with?(command, "me gusta") or 
        String.starts_with?(command, "mi ") or String.starts_with?(command, "come") or
        String.starts_with?(command, "esta ") or String.starts_with?(command, "este ") or
        String.starts_with?(command, "quiero") or String.starts_with?(command, "tengo") or
        String.starts_with?(command, "cuánto") or String.starts_with?(command, "cuenta") or String.starts_with?(command, "di ")
      
      "zh" ->
        # Chinese card sentence patterns
        String.contains?(command, "是") or String.contains?(command, "吃") or String.contains?(command, "我喜欢") or
        String.contains?(command, "我的") or String.contains?(command, "这个") or String.contains?(command, "那个") or
        String.contains?(command, "我要") or String.contains?(command, "我有") or String.contains?(command, "多少") or String.contains?(command, "数到")
      
      "ru" ->
        # Russian card sentence patterns
        String.contains?(command, "это") or String.contains?(command, "мой") or String.contains?(command, "моя") or 
        String.contains?(command, "съешь") or String.contains?(command, "мне нравится") or
        String.contains?(command, "я хочу") or String.contains?(command, "у меня") or String.contains?(command, "сколько")
      
      "ja" ->
        # Japanese card sentence patterns
        String.contains?(command, "は") or String.contains?(command, "です") or String.contains?(command, "を食べる") or
        String.contains?(command, "が好き") or String.contains?(command, "私の") or
        String.contains?(command, "がほしい") or String.contains?(command, "あります") or String.contains?(command, "いくつ")
      
      "it" ->
        # Italian card sentence patterns
        String.contains?(command, "è") or String.starts_with?(command, "mi piace") or 
        String.starts_with?(command, "mio ") or String.starts_with?(command, "mangia") or
        String.starts_with?(command, "voglio") or String.starts_with?(command, "ho ") or
        String.starts_with?(command, "quanto") or String.starts_with?(command, "conta") or String.starts_with?(command, "di ")
      
      "ar" ->
        # Arabic card sentence patterns
        String.contains?(command, "هذا") or String.contains?(command, "أحب") or String.contains?(command, "كل") or
        String.contains?(command, "أريد") or String.contains?(command, "عندي") or String.contains?(command, "قل")
      
      "pt" ->
        # Portuguese card sentence patterns
        String.contains?(command, "é") or String.starts_with?(command, "eu gosto") or 
        String.starts_with?(command, "meu ") or String.starts_with?(command, "coma") or
        String.starts_with?(command, "eu quero") or String.starts_with?(command, "eu tenho") or
        String.starts_with?(command, "quanto") or String.starts_with?(command, "conte") or String.starts_with?(command, "diga ")
      
      _ ->
        false  # Only allow card challenges in supported learning languages
    end
  end

  # Check if command is a look around command in the learning language
  defp is_look_command?(command, learning_language) do
    case learning_language do
      "en" -> String.contains?(command, "look around") or String.contains?(command, "look")
      "fr" -> String.contains?(command, "regarde autour") or String.contains?(command, "regarde")
      "es" -> String.contains?(command, "mira alrededor") or String.contains?(command, "mira")
      "zh" -> String.contains?(command, "看周围") or String.contains?(command, "看")
      "ru" -> String.contains?(command, "посмотри вокруг") or String.contains?(command, "посмотри")
      "ja" -> String.contains?(command, "周りを見る") or String.contains?(command, "見る")
      "it" -> String.contains?(command, "guarda intorno") or String.contains?(command, "guarda")
      "ar" -> String.contains?(command, "انظر حولك") or String.contains?(command, "انظر")
      "pt" -> String.contains?(command, "olha ao redor") or String.contains?(command, "olha")
      _ -> false  # Only allow look commands in supported learning languages
    end
  end

  # Check if command is a help command in the learning language
  defp is_help_command?(command, learning_language) do
    case learning_language do
      "en" -> String.contains?(command, "help")
      "fr" -> String.contains?(command, "aide")
      "es" -> String.contains?(command, "ayuda")
      "zh" -> String.contains?(command, "帮助")
      "ru" -> String.contains?(command, "помощь")
      "ja" -> String.contains?(command, "助け")
      "it" -> String.contains?(command, "aiuto")
      "ar" -> String.contains?(command, "مساعدة")
      "pt" -> String.contains?(command, "ajuda")
      _ -> false  # Only allow help commands in supported learning languages
    end
  end
end