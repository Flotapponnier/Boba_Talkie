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
      
      {"bakery", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/bakery")}
      
      {"bakery", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/bakery")}
      
      {"animals", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/animals")}
      
      {"animals", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/animals")}
      
      {"restaurant", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/restaurant")}
      
      {"restaurant", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/restaurant")}
      
      {"family", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/family")}
      
      {"family", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/family")}
      
      {"countries", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/countries")}
      
      {"countries", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/countries")}
      
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
      },
      %{
        id: "bakery",
        title: "Bakery",
        emoji: "🥐",
        description: "Learn bakery items and ordering phrases",
        difficulty: "Intermediate",
        vocabulary_count: 10,
        color: "bg-orange-100 border-orange-300",
        text_color: "text-orange-800"
      },
      %{
        id: "animals",
        title: "Animals",
        emoji: "🐶",
        description: "Discover animal vocabulary and descriptions",
        difficulty: "Beginner",
        vocabulary_count: 12,
        color: "bg-red-100 border-red-300",
        text_color: "text-red-800"
      },
      %{
        id: "restaurant",
        title: "Restaurant",
        emoji: "🍕",
        description: "Practice ordering food and restaurant phrases",
        difficulty: "Intermediate",
        vocabulary_count: 10,
        color: "bg-pink-100 border-pink-300",
        text_color: "text-pink-800"
      },
      %{
        id: "family",
        title: "Family",
        emoji: "👨‍👩‍👧‍👦",
        description: "Learn family relationships and descriptions",
        difficulty: "Intermediate",
        vocabulary_count: 10,
        color: "bg-indigo-100 border-indigo-300",
        text_color: "text-indigo-800"
      },
      %{
        id: "countries",
        title: "Countries",
        emoji: "🇹🇼",
        description: "Explore countries, nationalities, and cultures",
        difficulty: "Intermediate",
        vocabulary_count: 10,
        color: "bg-teal-100 border-teal-300",
        text_color: "text-teal-800"
      }
    ]
  end
end