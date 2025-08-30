defmodule BobaTalkie.Game.Card do
  @moduledoc """
  Card system for strategic sentence completion gameplay.
  Players must complete sentence templates by saying the full phrase 
  while standing on the correct object.
  """

  defstruct [:id, :template, :description, :applicable_objects, :completed, :selected]

  @type t :: %__MODULE__{
    id: String.t(),
    template: String.t(),
    description: String.t(), 
    applicable_objects: [atom()],
    completed: boolean(),
    selected: boolean()
  }

  # Card templates with their applicable objects
  @fruit_card_templates [
    %{
      template: "Eat the _",
      description: "Complete by saying 'Eat the [fruit]' while standing on a fruit",
      applicable_objects: [:apple, :banana, :orange, :grape, :strawberry, :cherry, :peach, :pineapple, :watermelon, :lemon, :avocado, :coconut, :mango, :kiwi, :tomato, :carrot, :bread, :milk, :cheese, :egg],
      type: :action_food
    },
    %{
      template: "This is a _", 
      description: "Complete by saying 'This is a [object]' while standing on any object",
      applicable_objects: [:apple, :banana, :orange, :grape, :strawberry, :cherry, :peach, :pineapple, :watermelon, :lemon, :avocado, :coconut, :mango, :kiwi, :tomato, :carrot, :bread, :milk, :cheese, :egg],
      type: :identify_any
    },
    %{
      template: "The _ is yellow",
      description: "Complete by saying 'The [object] is yellow' while on a yellow object",
      applicable_objects: [:banana],
      type: :color_yellow
    },
    %{
      template: "The _ is red",
      description: "Complete by saying 'The [object] is red' while on a red object", 
      applicable_objects: [:apple],
      type: :color_red
    },
    %{
      template: "The _ is orange",
      description: "Complete by saying 'The [object] is orange' while on an orange object",
      applicable_objects: [:orange],
      type: :color_orange
    },
    %{
      template: "The _ is purple",
      description: "Complete by saying 'The [object] is purple' while on a purple object",
      applicable_objects: [:grape],
      type: :color_purple
    }
  ]

  @introduction_card_templates [
    %{
      template: "Say _ to greet someone",
      description: "Complete by saying 'Say [greeting] to greet someone' while on a greeting",
      applicable_objects: [:hello, :goodbye, :excuse_me],
      type: :greeting_action
    },
    %{
      template: "My _ is Sarah",
      description: "Complete by saying 'My [name] is Sarah' while standing on name",
      applicable_objects: [:name, :where, :from],
      type: :introduce_name
    },
    %{
      template: "_ for helping me",
      description: "Complete by saying '[Thank you] for helping me' while on thank you",
      applicable_objects: [:thank_you, :please, :sorry],
      type: :gratitude_expression
    },
    %{
      template: "_ to meet you",
      description: "Complete by saying '[Nice to meet you] to meet you' while on nice to meet you",
      applicable_objects: [:nice_to_meet, :how_are_you, :fine, :yes, :no, :see_you_later],
      type: :meeting_expression
    },
    %{
      template: "I am _",
      description: "Complete by saying 'I am [fine]' while standing on fine",
      applicable_objects: [:fine],
      type: :state_expression
    },
    %{
      template: "_ me",
      description: "Complete by saying '[Excuse me]' while standing on excuse me",
      applicable_objects: [:excuse_me],
      type: :polite_expression
    },
    %{
      template: "The answer is _",
      description: "Complete by saying 'The answer is [yes/no]' while on yes or no",
      applicable_objects: [:yes, :no],
      type: :response_expression
    },
    %{
      template: "_ are you from",
      description: "Complete by saying '[Where] are you from' while standing on where",
      applicable_objects: [:where],
      type: :question_expression
    },
    %{
      template: "I come _ Canada",
      description: "Complete by saying 'I come [from] Canada' while standing on from",
      applicable_objects: [:from],
      type: :origin_expression
    }
  ]

  @numbers_card_templates [
    %{
      template: "Count to _",
      description: "Complete by saying 'Count to [number]' while standing on a number",
      applicable_objects: [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten],
      type: :counting_action
    },
    %{
      template: "I have _ apples",
      description: "Complete by saying 'I have [number] apples' while on a number",
      applicable_objects: [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten],
      type: :quantity_expression
    },
    %{
      template: "The number _ is my favorite",
      description: "Complete by saying 'The number [number] is my favorite' while on a number",
      applicable_objects: [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten],
      type: :preference_number
    },
    %{
      template: "Step _ forward",
      description: "Complete by saying 'Step [number] forward' while on a number",
      applicable_objects: [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten],
      type: :instruction_number
    }
  ]

  @bakery_card_templates [
    %{
      template: "I want a _",
      description: "Complete by saying 'I want a [bakery item]' while standing on a bakery item",
      applicable_objects: [:bread, :croissant, :bagel, :pretzel, :baguette, :cake, :cupcake, :donut, :cookie, :pie],
      type: :bakery_order
    },
    %{
      template: "This _ is delicious",
      description: "Complete by saying 'This [bakery item] is delicious' while on a bakery item",
      applicable_objects: [:bread, :croissant, :bagel, :pretzel, :baguette, :cake, :cupcake, :donut, :cookie, :pie],
      type: :bakery_taste
    },
    %{
      template: "How much is the _",
      description: "Complete by saying 'How much is the [bakery item]' while on a bakery item",
      applicable_objects: [:bread, :croissant, :bagel, :pretzel, :baguette, :cake, :cupcake, :donut, :cookie, :pie],
      type: :bakery_price
    },
    %{
      template: "I'll take two _",
      description: "Complete by saying 'I'll take two [bakery items]' while on a bakery item",
      applicable_objects: [:croissant, :bagel, :donut, :cookie],
      type: :bakery_quantity
    }
  ]

  @animals_card_templates [
    %{
      template: "The _ is cute",
      description: "Complete by saying 'The [animal] is cute' while standing on an animal",
      applicable_objects: [:dog, :cat, :rabbit, :bear, :panda, :lion, :tiger, :elephant, :monkey, :horse, :cow, :pig],
      type: :animal_description
    },
    %{
      template: "I have a pet _",
      description: "Complete by saying 'I have a pet [animal]' while on an animal",
      applicable_objects: [:dog, :cat, :rabbit, :bear, :panda],
      type: :pet_ownership
    },
    %{
      template: "The _ lives in the jungle",
      description: "Complete by saying 'The [animal] lives in the jungle' while on wild animals",
      applicable_objects: [:lion, :tiger, :elephant, :monkey],
      type: :animal_habitat
    },
    %{
      template: "I saw a _ at the zoo",
      description: "Complete by saying 'I saw a [animal] at the zoo' while on an animal",
      applicable_objects: [:lion, :tiger, :elephant, :monkey, :bear, :panda],
      type: :zoo_experience
    }
  ]

  @restaurant_card_templates [
    %{
      template: "I'd like to order _",
      description: "Complete by saying 'I'd like to order [food]' while standing on food",
      applicable_objects: [:pizza, :burger, :pasta, :salad, :soup],
      type: :restaurant_order
    },
    %{
      template: "Can I have the _",
      description: "Complete by saying 'Can I have the [item]' while on restaurant item",
      applicable_objects: [:menu, :pizza, :burger, :fries, :pasta, :salad, :soup, :bill],
      type: :restaurant_request
    },
    %{
      template: "I'll drink _",
      description: "Complete by saying 'I'll drink [beverage]' while on drinks",
      applicable_objects: [:coffee, :water],
      type: :drink_order
    },
    %{
      template: "The _ is ready",
      description: "Complete by saying 'The [food] is ready' while on food items",
      applicable_objects: [:pizza, :burger, :pasta, :soup],
      type: :food_ready
    }
  ]

  @family_card_templates [
    %{
      template: "This is my _",
      description: "Complete by saying 'This is my [family member]' while on family member",
      applicable_objects: [:mother, :father, :sister, :brother, :grandmother, :grandfather, :aunt, :uncle],
      type: :family_introduction
    },
    %{
      template: "I have two _",
      description: "Complete by saying 'I have two [family members]' while on family member",
      applicable_objects: [:sister, :brother],
      type: :family_quantity
    },
    %{
      template: "My _ is kind",
      description: "Complete by saying 'My [family member] is kind' while on family member",
      applicable_objects: [:mother, :father, :grandmother, :grandfather, :aunt, :uncle],
      type: :family_description
    },
    %{
      template: "I love my _",
      description: "Complete by saying 'I love my [family member/family]' while on family",
      applicable_objects: [:mother, :father, :sister, :brother, :grandmother, :grandfather, :baby, :family],
      type: :family_love
    }
  ]

  @countries_card_templates [
    %{
      template: "I am from _",
      description: "Complete by saying 'I am from [country]' while standing on country flag",
      applicable_objects: [:taiwan, :france, :germany, :japan, :usa, :uk, :italy, :spain, :china, :canada],
      type: :nationality
    },
    %{
      template: "He is _",
      description: "Complete by saying 'He is [nationality]' while on country flag",
      applicable_objects: [:france, :germany, :japan, :usa, :uk, :italy, :spain, :china, :canada],
      type: :person_nationality
    },
    %{
      template: "I eat bretzel in _",
      description: "Complete by saying 'I eat bretzel in [Germany]' while on Germany",
      applicable_objects: [:germany],
      type: :cultural_food
    },
    %{
      template: "I visited _",
      description: "Complete by saying 'I visited [country]' while on country flag",
      applicable_objects: [:taiwan, :france, :germany, :japan, :usa, :uk, :italy, :spain, :china, :canada],
      type: :travel_experience
    }
  ]

  @colors_card_templates [
    %{
      template: "The sky is _",
      description: "Complete by saying 'The sky is [color]' while standing on a color",
      applicable_objects: [:blue],
      type: :nature_color
    },
    %{
      template: "My shirt is _",
      description: "Complete by saying 'My shirt is [color]' while on a color",
      applicable_objects: [:red, :blue, :green, :yellow, :orange, :purple, :pink, :brown, :black, :white, :gray],
      type: :clothing_color
    },
    %{
      template: "I like the color _",
      description: "Complete by saying 'I like the color [color]' while on a color",
      applicable_objects: [:red, :blue, :green, :yellow, :orange, :purple, :pink, :brown, :black, :white, :gray],
      type: :color_preference
    },
    %{
      template: "The grass is _",
      description: "Complete by saying 'The grass is [color]' while standing on green",
      applicable_objects: [:green],
      type: :nature_green
    },
    %{
      template: "The sun is _",
      description: "Complete by saying 'The sun is [color]' while standing on yellow",
      applicable_objects: [:yellow],
      type: :nature_yellow
    },
    %{
      template: "The rose is _",
      description: "Complete by saying 'The rose is [color]' while standing on red or pink",
      applicable_objects: [:red, :pink],
      type: :nature_flower
    },
    %{
      template: "The night is _",
      description: "Complete by saying 'The night is [color]' while standing on black",
      applicable_objects: [:black],
      type: :nature_night
    },
    %{
      template: "The snow is _",
      description: "Complete by saying 'The snow is [color]' while standing on white",
      applicable_objects: [:white],
      type: :nature_snow
    },
    %{
      template: "The pumpkin is _",
      description: "Complete by saying 'The pumpkin is [color]' while standing on orange",
      applicable_objects: [:orange],
      type: :nature_pumpkin
    },
    %{
      template: "The elephant is _",
      description: "Complete by saying 'The elephant is [color]' while standing on gray",
      applicable_objects: [:gray],
      type: :animal_color
    },
    %{
      template: "My favorite color is _",
      description: "Complete by saying 'My favorite color is [color]' while on any color",
      applicable_objects: [:red, :blue, :green, :yellow, :orange, :purple, :pink, :brown, :black, :white, :gray],
      type: :personal_preference
    }
  ]

  @doc """
  Generate a deck of cards based on the actual objects in the world
  """
  def generate_deck(items, topic \\ "fruits", learning_language \\ "en") do
    # Get unique object types from the world
    object_types = items
    |> Map.values()
    |> Enum.map(& &1.type)
    |> Enum.uniq()
    
    # Get learning content from ContentManager
    content = BobaTalkie.ContentManager.get_learning_content(topic, learning_language)
    
    # Get appropriate card templates based on topic (fallback to English if content not available)
    card_templates = if Enum.empty?(content.cards) do
      case topic do
        "introduction" -> @introduction_card_templates
        "fruits" -> @fruit_card_templates
        "numbers" -> @numbers_card_templates
        "colors" -> @colors_card_templates
        "bakery" -> @bakery_card_templates
        "animals" -> @animals_card_templates
        "restaurant" -> @restaurant_card_templates
        "family" -> @family_card_templates
        "countries" -> @countries_card_templates
        _ -> @fruit_card_templates
      end
    else
      # Convert content cards to template format
      Enum.map(content.cards, fn card ->
        %{
          template: card.template,
          description: card.description,
          applicable_objects: object_types,  # Apply to all available objects for now
          type: :learning_content
        }
      end)
    end
    
    # Create cards that match the available objects
    available_cards = card_templates
    |> Enum.filter(fn template ->
      # Only include cards that can be completed with available objects
      Enum.any?(template.applicable_objects, fn obj_type ->
        obj_type in object_types
      end)
    end)
    
    # Take as many cards as we have objects (minimum 2, maximum available)
    num_cards = min(max(length(object_types), 2), length(available_cards))
    
    available_cards
    |> Enum.shuffle()
    |> Enum.take(num_cards)
    |> Enum.with_index()
    |> Enum.map(fn {template, index} ->
      %__MODULE__{
        id: "card_#{index}",
        template: template.template,
        description: template.description,
        applicable_objects: template.applicable_objects,
        completed: false,
        selected: false
      }
    end)
  end

  @doc """
  Check if a voice command matches a card's template for a specific object
  """
  def matches_card?(card, voice_command, object_type, learning_language \\ "en") do
    # Check if object is applicable for this card
    if object_type not in card.applicable_objects do
      false
    else
      # Clean the voice command and normalize spelling variations (British -> American)
      clean_command = voice_command
      |> String.downcase()
      |> String.trim()
      |> String.replace(~r/[^\w\s]/, "")
      |> String.replace("colour", "color")
      |> String.replace("favourite", "favorite") 
      |> String.replace("centre", "center")
      |> String.replace("grey", "gray")
      |> String.replace("realise", "realize")
      |> String.replace("organised", "organized")
      # Normalize digit numbers to word numbers for consistency
      |> String.replace(~r/\b1\b/, "one")
      |> String.replace(~r/\b2\b/, "two")
      |> String.replace(~r/\b3\b/, "three")
      |> String.replace(~r/\b4\b/, "four")
      |> String.replace(~r/\b5\b/, "five")
      |> String.replace(~r/\b6\b/, "six")
      |> String.replace(~r/\b7\b/, "seven")
      |> String.replace(~r/\b8\b/, "eight")
      |> String.replace(~r/\b9\b/, "nine")
      |> String.replace(~r/\b10\b/, "ten")
      
      # Get object name in the learning language
      object_name = get_object_name_in_language(object_type, learning_language)
      
      # Create expected sentence from template (template is in learning language)
      expected_sentence = String.replace(card.template, "_", object_name)
      |> String.downcase()
      
      # Check if the essential words are present in the command
      essential_words = String.split(expected_sentence, " ")
      
      # All essential words must be present (allows for extra words/mistakes)
      # Handle common plural/singular variations
      Enum.all?(essential_words, fn word ->
        String.contains?(clean_command, word) or
        # Handle plural/singular variations
        (word == "apples" and String.contains?(clean_command, "apple")) or
        (word == "apple" and String.contains?(clean_command, "apples")) or
        (word == "grapes" and String.contains?(clean_command, "grape")) or
        (word == "grape" and String.contains?(clean_command, "grapes")) or
        (word == "cherries" and String.contains?(clean_command, "cherry")) or
        (word == "cherry" and String.contains?(clean_command, "cherries")) or
        (word == "strawberries" and String.contains?(clean_command, "strawberry")) or
        (word == "strawberry" and String.contains?(clean_command, "strawberries")) or
        (word == "tomatoes" and String.contains?(clean_command, "tomato")) or
        (word == "tomato" and String.contains?(clean_command, "tomatoes")) or
        (word == "carrots" and String.contains?(clean_command, "carrot")) or
        (word == "carrot" and String.contains?(clean_command, "carrots")) or
        (word == "lemons" and String.contains?(clean_command, "lemon")) or
        (word == "lemon" and String.contains?(clean_command, "lemons")) or
        (word == "eggs" and String.contains?(clean_command, "egg")) or
        (word == "egg" and String.contains?(clean_command, "eggs"))
      end)
    end
  end

  @doc """
  Select a card (toggle selection)
  """
  def select_card(cards, card_id) do
    Enum.map(cards, fn card ->
      if card.id == card_id do
        %{card | selected: !card.selected}
      else
        %{card | selected: false}  # Deselect other cards
      end
    end)
  end

  @doc """
  Mark a card as completed
  """
  def complete_card(cards, card_id) do
    Enum.map(cards, fn card ->
      if card.id == card_id do
        %{card | completed: true, selected: false}
      else
        card
      end
    end)
  end

  @doc """
  Get the currently selected card
  """
  def get_selected_card(cards) do
    Enum.find(cards, &(&1.selected))
  end

  @doc """
  Check if all cards are completed
  """
  def all_completed?(cards) do
    Enum.all?(cards, &(&1.completed))
  end

  @doc """
  Get completion progress (completed/total)
  """
  def get_progress(cards) do
    completed = Enum.count(cards, &(&1.completed))
    total = length(cards)
    {completed, total}
  end

  # Private helper functions

  defp get_object_name(object_type) do
    case object_type do
      # Fruits
      :apple -> "apple"
      :banana -> "banana" 
      :orange_fruit -> "orange"
      :grape -> "grape"
      :strawberry -> "strawberry"
      :cherry -> "cherry"
      :peach -> "peach"
      :pineapple -> "pineapple"
      :watermelon -> "watermelon"
      :lemon -> "lemon"
      :avocado -> "avocado"
      :coconut -> "coconut"
      :mango -> "mango"
      :kiwi -> "kiwi"
      :tomato -> "tomato"
      :carrot -> "carrot"
      :bread -> "bread"
      :milk -> "milk"
      :cheese -> "cheese"
      :egg -> "egg"
      # Introduction objects
      :hello -> "hello"
      :name -> "name"
      :nice_to_meet -> "nice to meet you"
      :how_are_you -> "how are you"
      :fine -> "fine"
      :thank_you -> "thank you"
      :please -> "please"
      :excuse_me -> "excuse me"
      :sorry -> "sorry"
      :yes -> "yes"
      :no -> "no"
      :goodbye -> "goodbye"
      :see_you_later -> "see you later"
      :where -> "where"
      :from -> "from"
      # Numbers
      :one -> "one"
      :two -> "two"
      :three -> "three"
      :four -> "four"
      :five -> "five"
      :six -> "six"
      :seven -> "seven"
      :eight -> "eight"
      :nine -> "nine"
      :ten -> "ten"
      # Colors
      :red -> "red"
      :blue -> "blue"
      :green -> "green"
      :yellow -> "yellow"
      :orange -> "orange"
      :purple -> "purple"
      :pink -> "pink"
      :brown -> "brown"
      :black -> "black"
      :white -> "white"
      :gray -> "gray"
      # Bakery items
      :croissant -> "croissant"
      :bagel -> "bagel"
      :pretzel -> "pretzel"
      :baguette -> "baguette"
      :cake -> "cake"
      :cupcake -> "cupcake"
      :donut -> "donut"
      :cookie -> "cookie"
      :pie -> "pie"
      # Animals
      :dog -> "dog"
      :cat -> "cat"
      :rabbit -> "rabbit"
      :bear -> "bear"
      :panda -> "panda"
      :lion -> "lion"
      :tiger -> "tiger"
      :elephant -> "elephant"
      :monkey -> "monkey"
      :horse -> "horse"
      :cow -> "cow"
      :pig -> "pig"
      # Restaurant items
      :menu -> "menu"
      :pizza -> "pizza"
      :burger -> "burger"
      :fries -> "fries"
      :pasta -> "pasta"
      :salad -> "salad"
      :soup -> "soup"
      :coffee -> "coffee"
      :water -> "water"
      :bill -> "bill"
      # Family members
      :mother -> "mother"
      :father -> "father"
      :sister -> "sister"
      :brother -> "brother"
      :grandmother -> "grandmother"
      :grandfather -> "grandfather"
      :baby -> "baby"
      :family -> "family"
      :aunt -> "aunt"
      :uncle -> "uncle"
      # Countries
      :taiwan -> "taiwan"
      :france -> "france"
      :germany -> "germany"
      :japan -> "japan"
      :usa -> "usa"
      :uk -> "uk"
      :italy -> "italy"
      :spain -> "spain"
      :china -> "china"
      :canada -> "canada"
    end
  end

  @doc """
  Get object name in specific learning language
  """
  def get_object_name_in_language(object_type, learning_language) do
    # Get learning content to find the translated word
    content_item = case BobaTalkie.ContentManager.get_vocabulary_item_by_type(object_type, learning_language) do
      nil -> 
        # Fallback to English name
        get_object_name(object_type)
      item -> 
        item.word
    end
    
    content_item
  end

  @doc """
  Get expected answer for a card in the learning language
  """
  def get_expected_answer(card, object_type, learning_language) do
    object_name = get_object_name_in_language(object_type, learning_language)
    String.replace(card.template, "_", object_name)
  end
end