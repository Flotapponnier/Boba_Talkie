defmodule BobaTalkieWeb.MapSelectionLive do
  use BobaTalkieWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Select Your Adventure - BobaTalkie")
      |> assign(:levels, get_levels())

    {:ok, socket}
  end

  @impl true
  def handle_event("select_level", %{"level" => level, "mode" => mode}, socket) do
    case {level, mode} do
      {"introduction", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/introduction")}
      
      {"introduction", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/introduction")}
      
      {"fruits", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/fruits")}
      
      {"fruits", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/fruits")}
      
      {"numbers", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/numbers")}
      
      {"numbers", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/numbers")}
      
      {"colors", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/colors")}
      
      {"colors", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/colors")}
      
      _ ->
        {:noreply, put_flash(socket, :error, "Invalid selection")}
    end
  end

  @impl true
  def handle_event("back_to_home", _params, socket) do
    {:noreply, push_navigate(socket, to: ~p"/")}
  end

  defp get_levels do
    [
      %{
        id: "introduction",
        title: "Self-Introduction",
        emoji: "👋",
        description: "Learn basic phrases to introduce yourself",
        difficulty: "Beginner",
        vocabulary_count: 15,
        color: "bg-blue-100 border-blue-300",
        text_color: "text-blue-800"
      },
      %{
        id: "fruits",
        title: "Fruits & Food",
        emoji: "🍎",
        description: "Discover fruits and food vocabulary",
        difficulty: "Beginner",
        vocabulary_count: 20,
        color: "bg-green-100 border-green-300",
        text_color: "text-green-800"
      },
      %{
        id: "numbers",
        title: "Numbers",
        emoji: "1️⃣",
        description: "Practice counting and number vocabulary",
        difficulty: "Beginner",
        vocabulary_count: 12,
        color: "bg-purple-100 border-purple-300",
        text_color: "text-purple-800"
      },
      %{
        id: "colors",
        title: "Colors",
        emoji: "🌈",
        description: "Learn colors and color descriptions",
        difficulty: "Beginner",
        vocabulary_count: 16,
        color: "bg-yellow-100 border-yellow-300",
        text_color: "text-yellow-800"
      }
    ]
  end
end