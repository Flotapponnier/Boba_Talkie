defmodule BobaTalkieWeb.IndexLive do
  use BobaTalkieWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "BobaTalkie - Voice Learning Game")
      |> assign(:microphone_ready, false)
      |> assign(:browser_support, check_browser_support(socket))

    {:ok, socket}
  end

  @impl true
  def handle_event("check_microphone", _params, socket) do
    # This will be handled by JavaScript hook
    {:noreply, assign(socket, :microphone_ready, true)}
  end

  @impl true
  def handle_event("start_game", _params, socket) do
    {:noreply, push_navigate(socket, to: ~p"/maps")}
  end

  @impl true
  def handle_event("microphone_error", %{"error" => error}, socket) do
    {:noreply, put_flash(socket, :error, "Microphone error: #{error}")}
  end

  defp check_browser_support(_socket) do
    # For now, assume modern browsers support MediaRecorder
    # In production, this would check actual browser capabilities
    %{
      media_recorder: true,
      web_audio: true,
      websockets: true
    }
  end
end