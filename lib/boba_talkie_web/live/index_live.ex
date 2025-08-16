defmodule BobaTalkieWeb.IndexLive do
  use BobaTalkieWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "BobaTalkie - Voice Learning Game")

    {:ok, socket}
  end

  @impl true
  def handle_event("start_game", _params, socket) do
    IO.puts("DEBUG: start_game event received, navigating to /maps")
    {:noreply, push_navigate(socket, to: ~p"/maps")}
  end
end