defmodule BobaTalkieWeb.MapSelectionLive do
  use BobaTalkieWeb, :live_view
  import BobaTalkieWeb.LanguageSelector
  import Phoenix.LiveView
  alias BobaTalkieWeb.LanguageSession
  
  on_mount BobaTalkieWeb.LanguageHook

  @impl true
  def mount(params, session, socket) do
    interface_language = LanguageSession.get_interface_language(params, session, socket.assigns)
    learning_language = LanguageSession.get_learning_language(params, session, socket.assigns)
    
    socket =
      socket
      |> assign(:page_title, "Select Your Adventure - BobaTalkie")
      |> LanguageSession.set_locale_and_assign(interface_language, learning_language)
      |> assign(:levels, get_levels() |> Enum.map(&translate_level/1))

    {:ok, socket}
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

  @impl true
  def handle_event("change_learning_language", %{"value" => language_code}, socket) do
    # Use JavaScript to store and reload with new language
    socket = push_event(socket, "store_and_reload", %{
      interface_language: socket.assigns.interface_language, 
      learning_language: language_code
    })
    
    {:noreply, socket}
  end

  @impl true
  def handle_event("select_level", %{"level" => level, "mode" => mode}, socket) do
    base_params = LanguageSession.build_language_params(socket.assigns.interface_language, socket.assigns.learning_language)
    
    case {level, mode} do
      {"introduction", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/introduction?#{base_params}")}
      
      {"introduction", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/introduction?#{base_params}")}
      
      {"fruits", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/fruits?#{base_params}")}
      
      {"fruits", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/fruits?#{base_params}")}
      
      {"numbers", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/numbers?#{base_params}")}
      
      {"numbers", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/numbers?#{base_params}")}
      
      {"colors", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/colors?#{base_params}")}
      
      {"colors", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/colors?#{base_params}")}
      
      {"bakery", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/bakery?#{base_params}")}
      
      {"bakery", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/bakery?#{base_params}")}
      
      {"animals", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/animals?#{base_params}")}
      
      {"animals", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/animals?#{base_params}")}
      
      {"restaurant", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/restaurant?#{base_params}")}
      
      {"restaurant", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/restaurant?#{base_params}")}
      
      {"family", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/family?#{base_params}")}
      
      {"family", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/family?#{base_params}")}
      
      {"countries", "tutorial"} ->
        {:noreply, push_navigate(socket, to: ~p"/tutorial/countries?#{base_params}")}
      
      {"countries", "play"} ->
        {:noreply, push_navigate(socket, to: ~p"/game/countries?#{base_params}")}
      
      _ ->
        {:noreply, put_flash(socket, :error, "Invalid selection")}
    end
  end

  @impl true
  def handle_event("back_to_home", _params, socket) do
    params = LanguageSession.build_language_params(socket.assigns.interface_language, socket.assigns.learning_language)
    {:noreply, push_navigate(socket, to: ~p"/?#{params}")}
  end

  # Helper function to translate level data  
  defp translate_level(level) do
    %{level | 
      title: Gettext.gettext(BobaTalkieWeb.Gettext, level.title),
      description: Gettext.gettext(BobaTalkieWeb.Gettext, level.description),  
      difficulty: Gettext.gettext(BobaTalkieWeb.Gettext, level.difficulty)
    }
  end

  defp get_levels do
    [
      %{
        id: "introduction",
        title: "Self-Introduction",
        emoji: "👋",
        character_image: "/images/character/boba_welcome.png",
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
        character_image: "/images/character/boba_grocery.png",
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
        character_image: "/images/character/boba_number.png",
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
        character_image: "/images/character/boba_colour.png",
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
        character_image: "/images/character/boba_bakery.png",
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
        character_image: "/images/character/boba_animal.png",
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
        character_image: "/images/character/boba_luigi.png",
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
        character_image: "/images/character/boba_family.png",
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
        character_image: "/images/character/boba_travel.png",
        description: "Explore countries, nationalities, and cultures",
        difficulty: "Intermediate",
        vocabulary_count: 10,
        color: "bg-teal-100 border-teal-300",
        text_color: "text-teal-800"
      }
    ]
  end
end