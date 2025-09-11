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
  Generate a deck of cards based on the actual objects in the world.
  Creates exactly one card per emoji present, ensuring every card can be completed.
  """
  def generate_deck(items, topic \\ "fruits", learning_language \\ "en") do
    # Get unique object types from the world
    object_types = items
    |> Map.values()
    |> Enum.map(& &1.type)
    |> Enum.uniq()
    
    # Get learning content from ContentManager
    content = BobaTalkie.ContentManager.get_learning_content(topic, learning_language)
    
    # Generate one card per object present in the world
    object_types
    |> Enum.with_index()
    |> Enum.map(fn {object_type, index} ->
      # Try to find a card template from learning content first
      # Handle both singular and plural topic names (fruits -> fruit)
      singular_topic = case topic do
        "fruits" -> "fruit"
        "animals" -> "animal"
        "countries" -> "country"
        other -> other
      end
      
      learning_card = Enum.find(content.cards, fn card ->
        card.id == "#{singular_topic}_#{object_type}" or 
        card.id == "#{topic}_#{object_type}" or 
        String.contains?(card.id, Atom.to_string(object_type))
      end)
      
      case learning_card do
        # Use learning language card if available
        card_content when not is_nil(card_content) ->
          %__MODULE__{
            id: "card_#{index}",
            template: card_content.template,
            description: card_content.description,
            applicable_objects: [object_type],  # Only applies to this specific object
            completed: false,
            selected: false
          }
        
        # Fallback to English templates if no learning content
        nil ->
          fallback_template = get_fallback_template_for_object(object_type, topic)
          case fallback_template do
            nil ->
              # Generic fallback card
              %__MODULE__{
                id: "card_#{index}",
                template: "This is a _",
                description: "Identify the object",
                applicable_objects: [object_type],
                completed: false,
                selected: false
              }
            
            template ->
              %__MODULE__{
                id: "card_#{index}",
                template: template.template,
                description: template.description,
                applicable_objects: [object_type],
                completed: false,
                selected: false
              }
          end
      end
    end)
  end
  
  # Get fallback template for a specific object type
  defp get_fallback_template_for_object(object_type, topic) do
    templates = case topic do
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
    
    # Find a template that can work with this object type
    Enum.find(templates, fn template ->
      object_type in template.applicable_objects
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
      # Clean the voice command - only remove periods and common punctuation
      clean_command = voice_command
      |> String.downcase()
      |> String.trim()
      |> String.replace(~r/[.!?,:;]/, "")  # Only remove basic punctuation, keep everything else
      
      # Get the card template in the learning language from ContentManager
      learning_card = get_card_template_in_language(card.id, object_type, learning_language)
      
      case learning_card do
        nil ->
          # Fallback to original template if no learning language template exists
          fallback_match(card, clean_command, object_type, learning_language)
        
        learning_template ->
          # Use the learning language template
          object_name = get_object_name_in_language(object_type, learning_language)
          expected_sentence = String.replace(learning_template, "_", object_name)
          |> String.downcase()
          
          require Logger
          Logger.info("🃏 Card Matching - Template: '#{learning_template}', Object: '#{object_name}', Expected: '#{expected_sentence}', Said: '#{clean_command}'")
          Logger.info("🃏 Card Matching - Object type: #{object_type}, Learning language: #{learning_language}")
          
          # Check if the essential words are present in the command
          essential_words = String.split(expected_sentence, " ")
          |> Enum.reject(&(&1 == ""))
          
          Logger.info("🃏 Card Matching - Essential words: #{inspect(essential_words)}")
          Logger.info("🃏 Card Matching - Clean command: '#{clean_command}'")
          
          # All essential words must be present (allows for extra words/mistakes)
          result = Enum.all?(essential_words, fn word ->
            basic_match = String.contains?(clean_command, word)
            variation_match = handle_language_variations(word, clean_command, learning_language)
            apostrophe_match1 = String.starts_with?(word, "l'") and String.contains?(clean_command, String.slice(word, 2..-1//-1))
            apostrophe_match2 = not String.starts_with?(word, "l'") and String.contains?(clean_command, "l'" <> word)
            
            word_match = basic_match or variation_match or apostrophe_match1 or apostrophe_match2
            
            Logger.info("🃏 Card Matching - Word '#{word}': basic=#{basic_match}, variation=#{variation_match}, apos1=#{apostrophe_match1}, apos2=#{apostrophe_match2}, final=#{word_match}")
            word_match
          end)
          
          Logger.info("🃏 Card Matching - Final result: #{result}")
          result
      end
    end
  end
  
  # Get card template in specific learning language
  defp get_card_template_in_language(_card_id, object_type, learning_language) do
    # Determine topic from object type
    topic = case object_type do
      type when type in [:red, :blue, :green, :yellow, :orange, :purple, :pink, :brown, :black, :white, :gray] -> "colors"
      type when type in [:apple, :banana, :orange, :grape, :strawberry, :cherry, :peach, :pineapple, :watermelon, :lemon, :avocado, :coconut, :mango, :kiwi, :tomato, :carrot, :bread, :milk, :cheese, :egg] -> "fruits"
      type when type in [:hello, :name, :nice_to_meet, :how_are_you, :fine, :thank_you, :please, :excuse_me, :sorry, :yes, :no, :goodbye, :see_you_later, :where, :from] -> "introduction"
      type when type in [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten] -> "numbers"
      type when type in [:bread, :croissant, :bagel, :pretzel, :baguette, :cake, :cupcake, :donut, :cookie, :pie] -> "bakery"
      type when type in [:dog, :cat, :rabbit, :bear, :panda, :lion, :tiger, :elephant, :monkey, :horse, :cow, :pig] -> "animals"
      type when type in [:menu, :pizza, :burger, :fries, :pasta, :salad, :soup, :coffee, :water, :bill] -> "restaurant"
      type when type in [:mother, :father, :sister, :brother, :grandmother, :grandfather, :baby, :family, :aunt, :uncle] -> "family"
      type when type in [:taiwan, :france, :germany, :japan, :usa, :uk, :italy, :spain, :china, :canada] -> "countries"
      _ -> "colors"
    end
    
    # Get learning content for the topic and language
    content = BobaTalkie.ContentManager.get_learning_content(topic, learning_language)
    
    # Find the card that matches this object type
    # Handle both singular and plural topic names
    singular_topic = case topic do
      "fruits" -> "fruit"
      "animals" -> "animal" 
      "countries" -> "country"
      other -> other
    end
    
    object_id = "#{singular_topic}_#{object_type}"
    matching_card = Enum.find(content.cards, fn card_content ->
      card_content.id == object_id or 
      card_content.id == "#{topic}_#{object_type}" or
      String.contains?(card_content.id, Atom.to_string(object_type))
    end)
    
    case matching_card do
      nil -> nil
      card_content -> card_content.template
    end
  end
  
  # Handle language-specific variations
  defp handle_language_variations(word, clean_command, learning_language) do
    case learning_language do
      "fr" ->
        # French variations
        (word == "verte" and String.contains?(clean_command, "vertes")) or
        (word == "vertes" and String.contains?(clean_command, "verte")) or
        (word == "rouge" and String.contains?(clean_command, "rouges")) or
        (word == "rouges" and String.contains?(clean_command, "rouge")) or
        (word == "bleu" and String.contains?(clean_command, "bleus")) or
        (word == "bleus" and String.contains?(clean_command, "bleu")) or
        (word == "jaune" and String.contains?(clean_command, "jaunes")) or
        (word == "jaunes" and String.contains?(clean_command, "jaune")) or
        # French synonyms
        (word == "herbe" and String.contains?(clean_command, "arbre")) or
        (word == "arbre" and String.contains?(clean_command, "herbe")) or
        # Speech recognition errors
        (word == "cette" and String.contains?(clean_command, "7")) or
        (word == "cette" and String.contains?(clean_command, "cette"))  or
        (word == "juteuse" and String.contains?(clean_command, "et juteuse"))
      
      "es" ->
        # Spanish variations
        (word == "roja" and String.contains?(clean_command, "rojas")) or
        (word == "rojas" and String.contains?(clean_command, "roja")) or
        (word == "verde" and String.contains?(clean_command, "verdes")) or
        (word == "verdes" and String.contains?(clean_command, "verde"))
      
      _ ->
        # English variations
        (word == "apples" and String.contains?(clean_command, "apple")) or
        (word == "apple" and String.contains?(clean_command, "apples")) or
        (word == "grapes" and String.contains?(clean_command, "grape")) or
        (word == "grape" and String.contains?(clean_command, "grapes"))
    end
  end
  
  # Fallback matching for when no learning language template exists
  defp fallback_match(card, clean_command, object_type, learning_language) do
    # Get object name in the learning language
    object_name = get_object_name_in_language(object_type, learning_language)
    
    # Create expected sentence from template (template is in English, object name in learning language)
    expected_sentence = String.replace(card.template, "_", object_name)
    |> String.downcase()
    
    # Check if the essential words are present
    essential_words = String.split(expected_sentence, " ")
    |> Enum.reject(&(&1 == ""))
    
    Enum.all?(essential_words, fn word ->
      String.contains?(clean_command, word) or
      handle_language_variations(word, clean_command, learning_language)
    end)
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

  @doc """
  Check if all cards are completed
  """
  def all_cards_completed?(cards) when is_list(cards) do
    cards
    |> Enum.all?(fn card -> card.completed end)
  end

  @doc """
  Get completion statistics for cards
  """
  def get_completion_stats(cards) when is_list(cards) do
    total = length(cards)
    completed = Enum.count(cards, fn card -> card.completed end)
    remaining = total - completed
    percentage = if total == 0, do: 0, else: round(completed / total * 100)
    
    %{
      total: total,
      completed: completed,
      remaining: remaining,
      percentage: percentage
    }
  end

end