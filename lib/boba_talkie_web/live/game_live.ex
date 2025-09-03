defmodule BobaTalkieWeb.GameLive do
  use BobaTalkieWeb, :live_view
  import BobaTalkieWeb.LanguageSelector
  alias BobaTalkieWeb.LanguageSession

  # Core modules moved to modular components
  # alias BobaTalkie.Game.{World, Player}
  # alias BobaTalkie.Utils.DebugLogger
  
  # Import modular components
  alias BobaTalkieWeb.GameLive.{VoiceHandlers, MovementHandlers, UIHelpers, StateManager}
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(%{"topic" => topic} = params, session, socket) do
    interface_language = LanguageSession.get_interface_language(params, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(params, session, socket.assigns)
    
    socket = 
      socket
      |> LanguageSession.set_locale_and_assign(interface_language, learning_language)
      |> StateManager.initialize_game_state(topic, learning_language)
    {:ok, socket}
  end

  def mount(params, session, socket) do
    # Default to fruits level for backward compatibility
    interface_language = LanguageSession.get_interface_language(params, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(params, session, socket.assigns)
    
    socket = 
      socket
      |> LanguageSession.set_locale_and_assign(interface_language, learning_language)
      |> StateManager.initialize_game_state("fruits", learning_language)
    {:ok, socket}
  end

  @impl true
  def handle_event("start_listening", _params, socket) do
    socket = VoiceHandlers.handle_start_listening(socket)
    {:noreply, socket}
  end

  @impl true
  def handle_event("stop_listening", _params, socket) do
    socket = VoiceHandlers.handle_stop_listening(socket)
    {:noreply, socket}
  end

  @impl true
  def handle_event("voice_interim", %{"text" => text}, socket) do
    socket = VoiceHandlers.handle_voice_interim(socket, text)
    {:noreply, socket}
  end

  @impl true
  def handle_event("voice_command", %{"command" => command, "confidence" => confidence}, socket) do
    require Logger
    Logger.info("GameLive: Processing voice_command event: #{command}")
    
    try do
      # Process voice command directly (Web Speech API result)
      socket = VoiceHandlers.handle_voice_result(
        socket, 
        command, 
        confidence,
        socket.assigns.world, 
        socket.assigns.player
      )
      Logger.info("GameLive: voice_command processed successfully: #{command}")
      {:noreply, socket}
    rescue
      e ->
        Logger.error("GameLive: CRITICAL ERROR in voice_command handler: #{inspect(e)} for command: #{command}")
        Logger.error("GameLive: Stacktrace: #{Exception.format_stacktrace(__STACKTRACE__)}")
        socket = StateManager.add_game_message(socket, "Voice command error: #{command}")
        {:noreply, socket}
    end
  end

  @impl true
  def handle_event("voice_error", %{"error" => error}, socket) do
    socket = VoiceHandlers.handle_voice_error(socket, error)
    {:noreply, socket}
  end

  @impl true
  def handle_event("voice_audio", audio_params, socket) do
    # Handle MediaRecorder audio data for Brave browser
    case VoiceHandlers.handle_voice_audio(socket, audio_params, self()) do
      {:ok, updated_socket} -> {:noreply, updated_socket}
      {:error, error_socket} -> {:noreply, error_socket}
    end
  end

  @impl true
  def handle_event("start_deepgram_stream", _params, socket) do
    socket = VoiceHandlers.handle_start_deepgram_stream(socket, self())
    {:noreply, socket}
  end

  @impl true
  def handle_event("text_command", %{"command" => command}, socket) do
    require Logger
    Logger.info("GameLive: Processing text_command event: #{command}")
    
    try do
      # Process text command the same way as voice commands
      socket = VoiceHandlers.handle_voice_result(
        socket, 
        command, 
        1.0,  # Max confidence for typed commands
        socket.assigns.world, 
        socket.assigns.player
      )
      Logger.info("GameLive: text_command processed successfully: #{command}")
      {:noreply, socket}
    rescue
      e ->
        Logger.error("GameLive: CRITICAL ERROR in text_command handler: #{inspect(e)} for command: #{command}")
        Logger.error("GameLive: Stacktrace: #{Exception.format_stacktrace(__STACKTRACE__)}")
        socket = StateManager.add_game_message(socket, "Text command error: #{command}")
        {:noreply, socket}
    end
  end


  @impl true
  def handle_event("test_move", %{"direction" => direction}, socket) do
    case MovementHandlers.handle_test_move(socket, direction) do
      {:ok, updated_socket} -> {:noreply, updated_socket}
      {:error, error_socket} -> {:noreply, error_socket}
    end
  end


  @impl true
  def handle_event("change_interface_language", %{"value" => language_code}, socket) do
    # Store in localStorage via JavaScript hook
    socket = push_event(socket, "store_language", %{
      interface_language: language_code, 
      learning_language: socket.assigns.learning_language
    })
    
    # Update locale and socket assigns in real-time (no page reload)
    socket = LanguageSession.set_locale_and_assign(socket, language_code, socket.assigns.learning_language)
    
    # Force re-render by updating a timestamp
    socket = assign(socket, :language_updated_at, System.system_time(:millisecond))
    
    {:noreply, socket}
  end
  
  @impl true
  def handle_event("restore_languages", %{"interface_language" => interface_language, "learning_language" => learning_language}, socket) do
    # Restore languages from localStorage after page refresh
    socket = LanguageSession.set_locale_and_assign(socket, interface_language, learning_language)
    {:noreply, socket}
  end

  @impl true
  def handle_event("reset_game", _params, socket) do
    # Reset game state without page refresh
    topic = socket.assigns.topic
    learning_language = socket.assigns.learning_language
    
    socket = StateManager.initialize_game_state(socket, topic, learning_language)
    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle_card_description", %{"card_id" => card_id}, socket) do
    # Toggle the expanded state for a specific card
    expanded_descriptions = socket.assigns[:expanded_descriptions] || MapSet.new()
    
    new_expanded = if MapSet.member?(expanded_descriptions, card_id) do
      MapSet.delete(expanded_descriptions, card_id)
    else
      MapSet.put(expanded_descriptions, card_id)
    end
    
    socket = assign(socket, :expanded_descriptions, new_expanded)
    {:noreply, socket}
  end

  @impl true
  def handle_info({:voice_result, command, confidence}, socket) do
    require Logger
    Logger.info("GameLive: Processing async voice_result: #{command}")
    
    try do
      socket = VoiceHandlers.handle_voice_result(
        socket, 
        command, 
        confidence, 
        socket.assigns.world, 
        socket.assigns.player
      )
      Logger.info("GameLive: async voice_result processed successfully: #{command}")
      {:noreply, socket}
    rescue
      e ->
        Logger.error("GameLive: CRITICAL ERROR in async voice_result handler: #{inspect(e)} for command: #{command}")
        Logger.error("GameLive: Stacktrace: #{Exception.format_stacktrace(__STACKTRACE__)}")
        socket = StateManager.add_game_message(socket, "Async voice error: #{command}")
        {:noreply, socket}
    end
  end

  # Template helper functions (delegate to UIHelpers)
  
  defp cell_class(cell, world, position), do: UIHelpers.cell_class(cell, world, position)
  defp cell_icon(cell, world, position), do: UIHelpers.cell_icon(cell, world, position)
end