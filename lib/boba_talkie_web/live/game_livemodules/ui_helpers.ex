defmodule BobaTalkieWeb.GameLive.UIHelpers do
  @moduledoc """
  UI helper functions for GameLive templates.
  Contains functions for rendering game elements and styling.
  """

  @doc """
  Returns CSS class for different cell types in the game grid
  """
  def cell_class(cell, world \\ nil, position \\ nil) do
    cond do
      # Wall cells - no special color
      cell == 0 ->
        "!bg-gray-800 !border-gray-700 !border-2"
      
      # Player position - orange border (forced with !important)
      world && position && world.player_pos == position ->
        "!bg-green-100 !border-orange-500 !border-4"
      
      # Interactive object cells (type 3) - green border (forced with !important)
      cell == 3 ->
        "!bg-green-100 !border-green-600 !border-4"
      
      # Empty walkable cells (type 1)
      true ->
        "!bg-green-100 !border-gray-300 !border-2"
    end
  end

  @doc """
  Returns emoji icon for different cell types with player/item overlap handling
  """
  def cell_icon(cell, world \\ nil, position \\ nil)
  
  def cell_icon(cell, world, position) do
    # Check if player is at this position and there's also an item
    if world && position && world.player_pos == position do
      case Map.get(world.items, position) do
        %{emoji: emoji} -> 
          # Player is on an item - show both
          "🧑#{emoji}"
        _ -> 
          # Just player
          "🧑"
      end
    else
      # No player at this position, show normal cell content
      case cell do
        0 -> "⬛"  # Wall
        1 -> ""   # Empty
        2 -> "🧑"  # Player (shouldn't happen with new logic)
        3 -> 
          # Show specific fruit emoji if world and position provided
          if world && position do
            case Map.get(world.items, position) do
              %{emoji: emoji} -> emoji
              _ -> "🍎"  # Default fruit emoji
            end
          else
            "🍎"  # Default fruit emoji
          end
        _ -> "?"   # Unknown
      end
    end
  end

  @doc """
  Get fruit at specific position for display
  """
  def get_fruit_at_position(world, {x, y}) do
    Map.get(world.items, {x, y})
  end

  @doc """
  Format inventory for display
  """
  def format_inventory(inventory) do
    inventory
    |> Enum.group_by(& &1.type)
    |> Enum.map(fn {_type, items} -> 
      count = length(items)
      emoji = List.first(items).emoji
      "#{emoji} × #{count}"
    end)
    |> Enum.join(", ")
  end

  @doc """
  Format player position for display
  """
  def format_position({x, y}), do: "#{x}, #{y}"

  @doc """
  Format player stats for display
  """
  def format_pronunciation_score(score) when is_float(score) do
    Float.round(score * 100, 1)
  end
  def format_pronunciation_score(_), do: "0.0"

  @doc """
  Get status color class based on listening state
  """
  def listening_status_class(true), do: "text-green-400"
  def listening_status_class(false), do: "text-gray-400"

  @doc """
  Get listening indicator icon
  """
  def listening_indicator(true), do: "[ON]"
  def listening_indicator(false), do: "[OFF]"

  @doc """
  Format game message with timestamp (optional)
  """
  def format_game_message(message, opts \\ []) do
    if Keyword.get(opts, :timestamp, false) do
      time = DateTime.utc_now() |> DateTime.to_time() |> Time.to_string()
      "[#{time}] #{message}"
    else
      message
    end
  end

  @doc """
  Truncate long messages for display
  """
  def truncate_message(message, max_length \\ 100) do
    if String.length(message) > max_length do
      String.slice(message, 0, max_length - 3) <> "..."
    else
      message
    end
  end

  @doc """
  Get confidence color class based on voice recognition confidence
  """
  def confidence_color_class(confidence) when confidence >= 0.8, do: "text-green-400"
  def confidence_color_class(confidence) when confidence >= 0.6, do: "text-yellow-400"
  def confidence_color_class(confidence) when confidence >= 0.4, do: "text-orange-400"
  def confidence_color_class(_), do: "text-red-400"

  @doc """
  Format confidence percentage
  """
  def format_confidence(confidence) when is_float(confidence) do
    "#{Float.round(confidence * 100, 1)}%"
  end
  def format_confidence(_), do: "N/A"

  @doc """
  Get discovery message when player is on an emoji object
  """
  def get_discovery_message(world, interface_language \\ "en") do
    case Map.get(world.items, world.player_pos) do
      %{emoji: emoji, type: type} ->
        # Get interface language translation for this item
        topic = world.topic || determine_topic_from_type(type)
        vocab_translation = BobaTalkie.ContentManager.get_vocabulary_translation("#{topic}_#{type}", interface_language)
        translated_name = if vocab_translation, do: vocab_translation.word, else: Atom.to_string(type)
        
        # Translate "You found a" to interface language
        found_text = case interface_language do
          "fr" -> "Vous avez trouvé"
          "es" -> "Encontraste"
          "zh" -> "你发现了"
          "ru" -> "Вы нашли"
          "ja" -> "見つけました"
          "it" -> "Hai trovato"
          "ar" -> "وجدت"
          "pt" -> "Você encontrou"
          _ -> "You found a"
        end
        
        "#{found_text} #{emoji} (#{translated_name})!"
      _ ->
        nil
    end
  end

  @doc """
  Get effect circle class for objects (removed animation effects)
  """
  def get_effect_circle_class(_world, _position) do
    ""
  end

  @doc """
  Get vocabulary item with interface language translation for card display.
  Returns vocabulary item with added :translation field containing interface language word and example.
  """
  def get_card_vocabulary_with_translation(card_id, learning_content, interface_language) do
    # Find vocabulary item by ID
    vocab_item = Enum.find(learning_content.vocabulary || [], fn item -> item.id == card_id end)
    
    if vocab_item do
      # Get interface language translation
      translation = BobaTalkie.ContentManager.get_vocabulary_translation(card_id, interface_language)
      Map.put(vocab_item, :translation, translation)
    else
      nil
    end
  end

  # Helper function to determine topic from object type
  defp determine_topic_from_type(type) do
    case type do
      type when type in [:red, :blue, :green, :yellow, :orange, :purple, :pink, :brown, :black, :white, :gray] -> "colors"
      type when type in [:apple, :banana, :orange, :grape, :strawberry, :cherry, :peach, :pineapple, :watermelon, :lemon, :avocado, :coconut, :mango, :kiwi, :tomato, :carrot, :bread, :milk, :cheese, :egg] -> "fruits"
      type when type in [:hello, :name, :nice_to_meet, :how_are_you, :fine, :thank_you, :please, :excuse_me, :sorry, :yes, :no, :goodbye, :see_you_later, :where, :from] -> "introduction"
      type when type in [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten] -> "numbers"
      type when type in [:croissant, :bagel, :pretzel, :baguette, :cake, :cupcake, :donut, :cookie, :pie] -> "bakery"
      type when type in [:dog, :cat, :rabbit, :bear, :panda, :lion, :tiger, :elephant, :monkey, :horse, :cow, :pig] -> "animals"
      type when type in [:menu, :pizza, :burger, :fries, :pasta, :salad, :soup, :coffee, :water, :bill] -> "restaurant"
      type when type in [:mother, :father, :sister, :brother, :grandmother, :grandfather, :baby, :family, :aunt, :uncle] -> "family"
      type when type in [:taiwan, :france, :germany, :japan, :usa, :uk, :italy, :spain, :china, :canada] -> "countries"
      _ -> "fruits"
    end
  end
end