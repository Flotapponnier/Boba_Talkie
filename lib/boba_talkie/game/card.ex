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
  def generate_deck(items, topic \\ "fruits") do
    # Get unique object types from the world
    object_types = items
    |> Map.values()
    |> Enum.map(& &1.type)
    |> Enum.uniq()
    
    # Get appropriate card templates based on topic
    card_templates = case topic do
      "introduction" -> @introduction_card_templates
      "fruits" -> @fruit_card_templates
      "numbers" -> @numbers_card_templates
      "colors" -> @colors_card_templates
      _ -> @fruit_card_templates
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
  def matches_card?(card, voice_command, object_type) do
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
      
      # Get object name for matching
      object_name = get_object_name(object_type)
      
      # Create expected sentence from template
      expected_sentence = String.replace(card.template, "_", object_name)
      |> String.downcase()
      
      # Check if the essential words are present in the command
      essential_words = String.split(expected_sentence, " ")
      
      # All essential words must be present (allows for extra words/mistakes)
      Enum.all?(essential_words, fn word ->
        String.contains?(clean_command, word)
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
      :orange -> "orange"
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
    end
  end
end