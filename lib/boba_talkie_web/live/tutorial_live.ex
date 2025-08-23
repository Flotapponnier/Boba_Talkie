defmodule BobaTalkieWeb.TutorialLive do
  use BobaTalkieWeb, :live_view
  import BobaTalkieWeb.LanguageSelector
  alias BobaTalkieWeb.LanguageSession
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(%{"topic" => topic}, session, socket) do
    interface_language = LanguageSession.get_interface_language(%{}, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(%{}, session, socket.assigns)
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
          |> LanguageSession.set_locale_and_assign(interface_language, learning_language)

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

  defp get_tutorial_content("numbers") do
    %{
      title: "Numbers",
      emoji: "1️⃣",
      description: "Master counting and number vocabulary in English",
      vocabulary: [
        %{word: "One", emoji: "1️⃣", pronunciation: "WUN", example: "I have one apple"},
        %{word: "Two", emoji: "2️⃣", pronunciation: "TOO", example: "Two cats are playing"},
        %{word: "Three", emoji: "3️⃣", pronunciation: "THREE", example: "Count to three"},
        %{word: "Four", emoji: "4️⃣", pronunciation: "FOR", example: "Four wheels on a car"},
        %{word: "Five", emoji: "5️⃣", pronunciation: "FAYV", example: "High five!"},
        %{word: "Six", emoji: "6️⃣", pronunciation: "SIKS", example: "Six sides on a cube"},
        %{word: "Seven", emoji: "7️⃣", pronunciation: "SEV-un", example: "Lucky number seven"},
        %{word: "Eight", emoji: "8️⃣", pronunciation: "AYT", example: "Eight legs on a spider"},
        %{word: "Nine", emoji: "9️⃣", pronunciation: "NAYN", example: "Nine lives of a cat"},
        %{word: "Ten", emoji: "🔟", pronunciation: "TEN", example: "Ten fingers on your hands"},
        %{word: "First", emoji: "🥇", pronunciation: "FURST", example: "You are the first in line"},
        %{word: "Second", emoji: "🥈", pronunciation: "SEK-und", example: "Wait a second please"}
      ]
    }
  end

  defp get_tutorial_content("colors") do
    %{
      title: "Colors",
      emoji: "🌈",
      description: "Explore vibrant colors and color descriptions",
      vocabulary: [
        %{word: "Red", emoji: "🔴", pronunciation: "RED", example: "The rose is red"},
        %{word: "Blue", emoji: "🔵", pronunciation: "BLOO", example: "The sky is blue"},
        %{word: "Green", emoji: "🟢", pronunciation: "GREEN", example: "Grass is green"},
        %{word: "Yellow", emoji: "🟡", pronunciation: "YEL-oh", example: "The sun is yellow"},
        %{word: "Orange", emoji: "🟠", pronunciation: "OR-inj", example: "The orange fruit is orange"},
        %{word: "Purple", emoji: "🟣", pronunciation: "PUR-pul", example: "Purple flowers are beautiful"},
        %{word: "Pink", emoji: "🩷", pronunciation: "PINK", example: "Pink flamingos in the pond"},
        %{word: "Brown", emoji: "🤎", pronunciation: "BROWN", example: "Brown bear in the forest"},
        %{word: "Black", emoji: "⚫", pronunciation: "BLAK", example: "Black cat crossing the street"},
        %{word: "White", emoji: "⚪", pronunciation: "WHAYT", example: "White snow on the mountain"},
        %{word: "Gray", emoji: "🔘", pronunciation: "GRAY", example: "Gray clouds in the sky"},
        %{word: "Rainbow", emoji: "🌈", pronunciation: "RAYN-bow", example: "Rainbow after the rain"},
        %{word: "Bright", emoji: "✨", pronunciation: "BRYHT", example: "Bright colors are cheerful"},
        %{word: "Dark", emoji: "🌑", pronunciation: "DARK", example: "Dark colors look elegant"},
        %{word: "Light", emoji: "💡", pronunciation: "LYHT", example: "Light blue like the morning sky"},
        %{word: "Colorful", emoji: "🎨", pronunciation: "KUL-er-ful", example: "The painting is very colorful"}
      ]
    }
  end

  defp get_tutorial_content("bakery") do
    %{
      title: "Bakery",
      emoji: "🥐",
      description: "Learn essential bakery vocabulary and ordering phrases",
      vocabulary: [
        %{word: "Bread", emoji: "🍞", pronunciation: "BRED", example: "Fresh bread smells amazing"},
        %{word: "Croissant", emoji: "🥐", pronunciation: "kwah-SAHN", example: "A buttery French croissant"},
        %{word: "Bagel", emoji: "🥯", pronunciation: "BAY-gul", example: "Toasted bagel with cream cheese"},
        %{word: "Pretzel", emoji: "🥨", pronunciation: "PRET-zul", example: "Salty twisted pretzel"},
        %{word: "Baguette", emoji: "🥖", pronunciation: "ba-GET", example: "Long French baguette"},
        %{word: "Cake", emoji: "🎂", pronunciation: "KAYK", example: "Birthday cake with candles"},
        %{word: "Cupcake", emoji: "🧁", pronunciation: "KUP-kayk", example: "Sweet chocolate cupcake"},
        %{word: "Donut", emoji: "🍩", pronunciation: "DOH-nut", example: "Glazed donut for breakfast"},
        %{word: "Cookie", emoji: "🍪", pronunciation: "KUK-ee", example: "Chocolate chip cookie"},
        %{word: "Pie", emoji: "🥧", pronunciation: "PYE", example: "Apple pie for dessert"}
      ]
    }
  end

  defp get_tutorial_content("animals") do
    %{
      title: "Animals",
      emoji: "🐶",
      description: "Discover animal vocabulary and their characteristics",
      vocabulary: [
        %{word: "Dog", emoji: "🐶", pronunciation: "DAWG", example: "The dog is man's best friend"},
        %{word: "Cat", emoji: "🐱", pronunciation: "KAT", example: "The cat sleeps in the sun"},
        %{word: "Rabbit", emoji: "🐰", pronunciation: "RAB-it", example: "The rabbit hops quickly"},
        %{word: "Bear", emoji: "🐻", pronunciation: "BAIR", example: "The brown bear is strong"},
        %{word: "Panda", emoji: "🐼", pronunciation: "PAN-da", example: "Giant panda eats bamboo"},
        %{word: "Lion", emoji: "🦁", pronunciation: "LYE-un", example: "The lion is king of jungle"},
        %{word: "Tiger", emoji: "🐯", pronunciation: "TYE-gur", example: "The tiger has stripes"},
        %{word: "Elephant", emoji: "🐘", pronunciation: "EL-uh-fant", example: "The elephant is very big"},
        %{word: "Monkey", emoji: "🐵", pronunciation: "MUNG-kee", example: "The monkey swings on trees"},
        %{word: "Horse", emoji: "🐴", pronunciation: "HORS", example: "The horse runs fast"},
        %{word: "Cow", emoji: "🐄", pronunciation: "KOW", example: "The cow gives milk"},
        %{word: "Pig", emoji: "🐷", pronunciation: "PIG", example: "The pig rolls in mud"}
      ]
    }
  end

  defp get_tutorial_content("restaurant") do
    %{
      title: "Restaurant",
      emoji: "🍕",
      description: "Master restaurant vocabulary and ordering phrases",
      vocabulary: [
        %{word: "Menu", emoji: "📋", pronunciation: "MEN-yoo", example: "Can I see the menu please?"},
        %{word: "Pizza", emoji: "🍕", pronunciation: "PEET-za", example: "I'll have a slice of pizza"},
        %{word: "Burger", emoji: "🍔", pronunciation: "BUR-gur", example: "Cheeseburger with fries"},
        %{word: "Fries", emoji: "🍟", pronunciation: "FRYZ", example: "French fries are crispy"},
        %{word: "Pasta", emoji: "🍝", pronunciation: "PAHS-ta", example: "Spaghetti pasta with sauce"},
        %{word: "Salad", emoji: "🥗", pronunciation: "SAL-ad", example: "Fresh green salad"},
        %{word: "Soup", emoji: "🍲", pronunciation: "SOOP", example: "Hot chicken soup"},
        %{word: "Coffee", emoji: "☕", pronunciation: "KAW-fee", example: "Hot black coffee"},
        %{word: "Water", emoji: "💧", pronunciation: "WAW-tur", example: "Glass of cold water"},
        %{word: "Bill", emoji: "🧾", pronunciation: "BIL", example: "Can I have the bill?"}
      ]
    }
  end

  defp get_tutorial_content("family") do
    %{
      title: "Family",
      emoji: "👨‍👩‍👧‍👦",
      description: "Learn family relationships and descriptions",
      vocabulary: [
        %{word: "Mother", emoji: "👩", pronunciation: "MUTH-ur", example: "My mother is very kind"},
        %{word: "Father", emoji: "👨", pronunciation: "FAH-thur", example: "My father works hard"},
        %{word: "Sister", emoji: "👧", pronunciation: "SIS-tur", example: "I have two sisters"},
        %{word: "Brother", emoji: "👦", pronunciation: "BRUTH-ur", example: "My brother is younger"},
        %{word: "Grandmother", emoji: "👵", pronunciation: "GRAND-muth-ur", example: "Grandmother tells great stories"},
        %{word: "Grandfather", emoji: "👴", pronunciation: "GRAND-fah-thur", example: "Grandfather is very wise"},
        %{word: "Baby", emoji: "👶", pronunciation: "BAY-bee", example: "The baby is sleeping"},
        %{word: "Family", emoji: "👨‍👩‍👧‍👦", pronunciation: "FAM-uh-lee", example: "I love my family"},
        %{word: "Aunt", emoji: "👸", pronunciation: "ANT", example: "My aunt lives nearby"},
        %{word: "Uncle", emoji: "🤴", pronunciation: "UNG-kul", example: "Uncle visits on weekends"}
      ]
    }
  end

  defp get_tutorial_content("countries") do
    %{
      title: "Countries",
      emoji: "🇹🇼",
      description: "Explore countries, nationalities, and cultural expressions",
      vocabulary: [
        %{word: "Taiwan", emoji: "🇹🇼", pronunciation: "TYE-wahn", example: "Taiwan is a beautiful island"},
        %{word: "France", emoji: "🇫🇷", pronunciation: "FRANS", example: "France is famous for cuisine"},
        %{word: "Germany", emoji: "🇩🇪", pronunciation: "JUR-man-ee", example: "Germany has great beer"},
        %{word: "Japan", emoji: "🇯🇵", pronunciation: "juh-PAN", example: "Japan has beautiful cherry blossoms"},
        %{word: "USA", emoji: "🇺🇸", pronunciation: "yoo-es-AY", example: "USA is very diverse"},
        %{word: "UK", emoji: "🇬🇧", pronunciation: "yoo-KAY", example: "UK has a rich history"},
        %{word: "Italy", emoji: "🇮🇹", pronunciation: "IT-uh-lee", example: "Italy makes great pasta"},
        %{word: "Spain", emoji: "🇪🇸", pronunciation: "SPAYN", example: "Spain has flamenco dancing"},
        %{word: "China", emoji: "🇨🇳", pronunciation: "CHY-na", example: "China has a long history"},
        %{word: "Canada", emoji: "🇨🇦", pronunciation: "KAN-uh-da", example: "Canada is known for maple syrup"}
      ]
    }
  end

  defp get_tutorial_content(_), do: nil

  def current_vocabulary_item(content, index) do
    Enum.at(content.vocabulary, index)
  end
end