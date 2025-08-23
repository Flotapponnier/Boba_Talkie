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
    # Process voice command directly (Web Speech API result)
    socket = VoiceHandlers.handle_voice_result(
      socket, 
      command, 
      confidence,
      socket.assigns.world, 
      socket.assigns.player
    )
    {:noreply, socket}
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
    # Process text command the same way as voice commands
    socket = VoiceHandlers.handle_voice_result(
      socket, 
      command, 
      1.0,  # Max confidence for typed commands
      socket.assigns.world, 
      socket.assigns.player
    )
    {:noreply, socket}
  end


  @impl true
  def handle_event("test_move", %{"direction" => direction}, socket) do
    case MovementHandlers.handle_test_move(socket, direction) do
      {:ok, updated_socket} -> {:noreply, updated_socket}
      {:error, error_socket} -> {:noreply, error_socket}
    end
  end

  @impl true
  def handle_event("select_card", %{"card_id" => card_id}, socket) do
    new_world = BobaTalkie.Game.World.select_card(socket.assigns.world, card_id)
    updated_socket = Phoenix.Component.assign(socket, :world, new_world)
    {:noreply, updated_socket}
  end

  @impl true
  def handle_info({:voice_result, command, confidence}, socket) do
    socket = VoiceHandlers.handle_voice_result(
      socket, 
      command, 
      confidence, 
      socket.assigns.world, 
      socket.assigns.player
    )
    {:noreply, socket}
  end

  @impl true
  def handle_event("change_interface_language", %{"value" => language_code}, socket) do
    # Use JavaScript to store and reload with new language
    socket = push_event(socket, "store_and_reload", %{
      interface_language: language_code, 
      learning_language: socket.assigns.learning_language
    })
    
    {:noreply, socket}
  end

  # Template helper functions (delegate to UIHelpers)
  
  defp cell_class(cell, world, position), do: UIHelpers.cell_class(cell, world, position)
  defp cell_icon(cell, world, position), do: UIHelpers.cell_icon(cell, world, position)
end