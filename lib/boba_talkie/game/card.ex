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
  @card_templates [
    %{
      template: "Eat the _",
      description: "Complete by saying 'Eat the [fruit]' while standing on a fruit",
      applicable_objects: [:apple, :banana, :orange, :grape],
      type: :action_food
    },
    %{
      template: "This is a _", 
      description: "Complete by saying 'This is a [object]' while standing on any object",
      applicable_objects: [:apple, :banana, :orange, :grape],
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

  @doc """
  Generate a deck of cards based on the actual objects in the world
  """
  def generate_deck(fruit_items) do
    # Get unique object types from the world
    object_types = fruit_items
    |> Map.values()
    |> Enum.map(& &1.type)
    |> Enum.uniq()
    
    # Create cards that match the available objects
    available_cards = @card_templates
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
      # Clean the voice command
      clean_command = voice_command
      |> String.downcase()
      |> String.trim()
      |> String.replace(~r/[^\w\s]/, "")
      
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
      :apple -> "apple"
      :banana -> "banana" 
      :orange -> "orange"
      :grape -> "grape"
    end
  end
end