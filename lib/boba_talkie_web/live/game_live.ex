defmodule BobaTalkieWeb.GameLive do
  use BobaTalkieWeb, :live_view

  # Core modules moved to modular components
  # alias BobaTalkie.Game.{World, Player}
  # alias BobaTalkie.Utils.DebugLogger
  
  # Import modular components
  alias BobaTalkieWeb.GameLive.{VoiceHandlers, MovementHandlers, UIHelpers, StateManager}

  @impl true
  def mount(_params, _session, socket) do
    socket = StateManager.initialize_game_state(socket)
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

  # Template helper functions (delegate to UIHelpers)
  
  defp cell_class(cell), do: UIHelpers.cell_class(cell)
  defp cell_icon(cell), do: UIHelpers.cell_icon(cell)
end