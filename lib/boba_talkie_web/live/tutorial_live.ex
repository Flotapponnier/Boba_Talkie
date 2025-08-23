defmodule BobaTalkieWeb.TutorialLive do
  use BobaTalkieWeb, :live_view
  import BobaTalkieWeb.LanguageSelector
  alias BobaTalkieWeb.LanguageSession
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(%{"topic" => topic}, session, socket) do
    interface_language = LanguageSession.get_interface_language(%{}, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(%{}, session, socket.assigns)
    
    # Get learning content from ContentManager
    learning_content = BobaTalkie.ContentManager.get_learning_content(topic, learning_language)
    # Get static tutorial metadata (title, description, etc.)
    tutorial_metadata = get_tutorial_metadata(topic)
    
    case {tutorial_metadata, learning_content} do
      {nil, _} ->
        {:ok, 
         socket
         |> put_flash(:error, "Tutorial not found")
         |> push_navigate(to: ~p"/maps")}
      
      {metadata, content} when content.tutorial != [] ->
        # Combine metadata with learning content
        combined_content = %{
          title: metadata.title,
          emoji: metadata.emoji,
          description: metadata.description,
          vocabulary: content.tutorial  # Use tutorial items from ContentManager
        }
        
        socket =
          socket
          |> assign(:page_title, "Tutorial: #{metadata.title} - BobaTalkie")
          |> assign(:topic, topic)
          |> assign(:content, combined_content)
          |> assign(:current_item, 0)
          |> assign(:show_pronunciation, false)
          |> LanguageSession.set_locale_and_assign(interface_language, learning_language)

        {:ok, socket}
        
      _ ->
        {:ok, 
         socket
         |> put_flash(:error, "Tutorial content not available")
         |> push_navigate(to: ~p"/maps")}
    end
  end

  @impl true
  def handle_event("next_item", _params, socket) do
    max_items = length(socket.assigns.content.vocabulary) - 1
    current = min(socket.assigns.current_item + 1, max_items)
    {:noreply, assign(socket, :current_item, current)}
  end

  @impl true
  def handle_event("prev_item", _params, socket) do
    current = max(socket.assigns.current_item - 1, 0)
    {:noreply, assign(socket, :current_item, current)}
  end

  @impl true
  def handle_event("toggle_pronunciation", _params, socket) do
    {:noreply, assign(socket, :show_pronunciation, !socket.assigns.show_pronunciation)}
  end

  @impl true
  def handle_event("start_game", _params, socket) do
    game_path = case socket.assigns.topic do
      "introduction" -> ~p"/game/introduction"
      "fruits" -> ~p"/game/fruits"
      "numbers" -> ~p"/game/numbers"
      "colors" -> ~p"/game/colors"
      "bakery" -> ~p"/game/bakery"
      "animals" -> ~p"/game/animals"
      "restaurant" -> ~p"/game/restaurant"
      "family" -> ~p"/game/family"
      "countries" -> ~p"/game/countries"
      _ -> ~p"/maps"
    end
    {:noreply, push_navigate(socket, to: game_path)}
  end

  @impl true
  def handle_event("back_to_maps", _params, socket) do
    {:noreply, push_navigate(socket, to: ~p"/maps")}
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

  # Tutorial metadata (language-independent)
  defp get_tutorial_metadata("introduction") do
    %{
      title: "Self-Introduction",
      emoji: "👋",
      description: "Learn essential phrases to introduce yourself"
    }
  end

  defp get_tutorial_metadata("fruits") do
    %{
      title: "Fruits & Food",
      emoji: "🍎",
      description: "Discover delicious fruits and food vocabulary"
    }
  end

  defp get_tutorial_metadata("numbers") do
    %{
      title: "Numbers",
      emoji: "1️⃣",
      description: "Master counting and number vocabulary"
    }
  end

  defp get_tutorial_metadata("colors") do
    %{
      title: "Colors",
      emoji: "🌈",
      description: "Explore vibrant colors and color descriptions"
    }
  end

  defp get_tutorial_metadata("bakery") do
    %{
      title: "Bakery",
      emoji: "🥐",
      description: "Learn essential bakery vocabulary and ordering phrases"
    }
  end

  defp get_tutorial_metadata("animals") do
    %{
      title: "Animals",
      emoji: "🐶",
      description: "Discover animal vocabulary and their characteristics"
    }
  end

  defp get_tutorial_metadata("restaurant") do
    %{
      title: "Restaurant",
      emoji: "🍕",
      description: "Master restaurant vocabulary and ordering phrases"
    }
  end

  defp get_tutorial_metadata("family") do
    %{
      title: "Family",
      emoji: "👨‍👩‍👧‍👦",
      description: "Learn family relationships and descriptions"
    }
  end

  defp get_tutorial_metadata("countries") do
    %{
      title: "Countries",
      emoji: "🇹🇼",
      description: "Explore countries, nationalities, and cultural expressions"
    }
  end

  defp get_tutorial_metadata(_), do: nil

  def current_vocabulary_item(content, index) do
    Enum.at(content.vocabulary, index)
  end

  @doc """
  Get current vocabulary item with interface language translation
  """
  def current_vocabulary_item_with_translation(content, index, interface_language) do
    item = Enum.at(content.vocabulary, index)
    if item && Map.has_key?(item, :id) do
      translation = BobaTalkie.ContentManager.get_vocabulary_translation(item.id, interface_language)
      Map.put(item, :translation, translation)
    else
      item
    end
  end
end