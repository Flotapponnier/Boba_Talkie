defmodule BobaTalkieWeb.TutorialLive do
  use BobaTalkieWeb, :live_view

  @impl true
  def mount(%{"topic" => topic}, _session, socket) do
    case get_tutorial_content(topic) do
      nil ->
        {:ok, 
         socket
         |> put_flash(:error, "Tutorial not found")
         |> push_navigate(to: ~p"/maps")}
      
      content ->
        socket =
          socket
          |> assign(:page_title, "Tutorial: #{content.title} - BobaTalkie")
          |> assign(:topic, topic)
          |> assign(:content, content)
          |> assign(:current_item, 0)
          |> assign(:show_pronunciation, false)

        {:ok, socket}
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
      "fruits" -> ~p"/game"
      _ -> ~p"/maps"
    end
    {:noreply, push_navigate(socket, to: game_path)}
  end

  @impl true
  def handle_event("back_to_maps", _params, socket) do
    {:noreply, push_navigate(socket, to: ~p"/maps")}
  end

  defp get_tutorial_content("introduction") do
    %{
      title: "Self-Introduction",
      emoji: "👋",
      description: "Learn essential phrases to introduce yourself in English",
      vocabulary: [
        %{word: "Hello", emoji: "👋", pronunciation: "HEH-low", example: "Hello, my name is Sarah"},
        %{word: "Name", emoji: "📛", pronunciation: "NAYM", example: "My name is John"},
        %{word: "Nice to meet you", emoji: "🤝", pronunciation: "NAYS too MEET yoo", example: "Nice to meet you too!"},
        %{word: "How are you?", emoji: "😊", pronunciation: "HOW ar YOO", example: "How are you today?"},
        %{word: "Fine", emoji: "👌", pronunciation: "FYNE", example: "I'm fine, thank you"},
        %{word: "Thank you", emoji: "🙏", pronunciation: "THANK yoo", example: "Thank you very much"},
        %{word: "Please", emoji: "🥺", pronunciation: "PLEEZ", example: "Please help me"},
        %{word: "Excuse me", emoji: "🙋", pronunciation: "ik-SKYOOZ mee", example: "Excuse me, where is the bathroom?"},
        %{word: "Sorry", emoji: "😔", pronunciation: "SOR-ee", example: "Sorry, I'm late"},
        %{word: "Yes", emoji: "✅", pronunciation: "YES", example: "Yes, I understand"},
        %{word: "No", emoji: "❌", pronunciation: "NOH", example: "No, I don't think so"},
        %{word: "Goodbye", emoji: "👋", pronunciation: "gud-BYE", example: "Goodbye, see you later"},
        %{word: "See you later", emoji: "🔄", pronunciation: "SEE yoo LAY-ter", example: "See you later, have a good day"},
        %{word: "Where", emoji: "📍", pronunciation: "WAIR", example: "Where are you from?"},
        %{word: "From", emoji: "🏠", pronunciation: "FRUM", example: "I'm from Canada"}
      ]
    }
  end

  defp get_tutorial_content("fruits") do
    %{
      title: "Fruits & Food",
      emoji: "🍎",
      description: "Discover delicious fruits and food vocabulary",
      vocabulary: [
        %{word: "Apple", emoji: "🍎", pronunciation: "AP-ul", example: "I eat an apple every day"},
        %{word: "Banana", emoji: "🍌", pronunciation: "buh-NAN-uh", example: "The banana is yellow"},
        %{word: "Orange", emoji: "🍊", pronunciation: "OR-inj", example: "Orange juice is healthy"},
        %{word: "Grape", emoji: "🍇", pronunciation: "GRAYP", example: "Purple grapes are sweet"},
        %{word: "Strawberry", emoji: "🍓", pronunciation: "STRAW-ber-ee", example: "Strawberries and cream"},
        %{word: "Cherry", emoji: "🍒", pronunciation: "CHAIR-ee", example: "Red cherries are delicious"},
        %{word: "Peach", emoji: "🍑", pronunciation: "PEECH", example: "This peach is very juicy"},
        %{word: "Pineapple", emoji: "🍍", pronunciation: "PYN-ap-ul", example: "Pineapple pizza is controversial"},
        %{word: "Watermelon", emoji: "🍉", pronunciation: "WAH-ter-mel-un", example: "Watermelon is perfect for summer"},
        %{word: "Lemon", emoji: "🍋", pronunciation: "LEM-un", example: "Lemon water is refreshing"},
        %{word: "Avocado", emoji: "🥑", pronunciation: "av-uh-KAH-doh", example: "Avocado toast for breakfast"},
        %{word: "Coconut", emoji: "🥥", pronunciation: "KOH-kuh-nut", example: "Coconut milk is creamy"},
        %{word: "Mango", emoji: "🥭", pronunciation: "MANG-goh", example: "Tropical mango smoothie"},
        %{word: "Kiwi", emoji: "🥝", pronunciation: "KEE-wee", example: "Kiwi fruit is green inside"},
        %{word: "Tomato", emoji: "🍅", pronunciation: "tuh-MAY-toh", example: "Is tomato a fruit or vegetable?"},
        %{word: "Carrot", emoji: "🥕", pronunciation: "KAIR-ut", example: "Carrots are good for your eyes"},
        %{word: "Bread", emoji: "🍞", pronunciation: "BRED", example: "Fresh bread smells amazing"},
        %{word: "Milk", emoji: "🥛", pronunciation: "MILK", example: "Drink your milk for strong bones"},
        %{word: "Cheese", emoji: "🧀", pronunciation: "CHEEZ", example: "I love cheese on my sandwich"},
        %{word: "Egg", emoji: "🥚", pronunciation: "EG", example: "Scrambled eggs for breakfast"}
      ]
    }
  end

  defp get_tutorial_content(_), do: nil

  def current_vocabulary_item(content, index) do
    Enum.at(content.vocabulary, index)
  end
end