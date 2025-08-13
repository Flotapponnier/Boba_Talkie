defmodule BobaTalkie.Game.World do
  @moduledoc """
  Manages the 2D grid world state and logic.
  
  Grid cell values:
  - 0: Wall/obstacle (impassable)
  - 1: Empty walkable space
  - 2: Player position
  - 3: Interactive item/object
  """

  defstruct [:grid, :width, :height, :player_pos, :items, :cards]

  @type cell_type :: 0..3
  @type position :: {integer(), integer()}
  
  @type t :: %__MODULE__{
    grid: [[cell_type()]],
    width: integer(),
    height: integer(),
    player_pos: position(),
    items: %{position() => map()},
    cards: [BobaTalkie.Game.Card.t()]
  }

  # Available fruits in the game
  # All available fruit and food items (matching tutorial vocabulary)
  @all_fruits_items [
    %{type: :apple, name: "apple", emoji: "🍎", voice_commands: ["apple", "red apple", "green apple"]},
    %{type: :banana, name: "banana", emoji: "🍌", voice_commands: ["banana", "yellow banana", "ripe banana"]},
    %{type: :orange, name: "orange", emoji: "🍊", voice_commands: ["orange", "orange fruit", "juicy orange"]},
    %{type: :grape, name: "grape", emoji: "🍇", voice_commands: ["grape", "grapes", "purple grape"]},
    %{type: :strawberry, name: "strawberry", emoji: "🍓", voice_commands: ["strawberry", "strawberries", "red strawberry"]},
    %{type: :cherry, name: "cherry", emoji: "🍒", voice_commands: ["cherry", "cherries", "red cherry"]},
    %{type: :peach, name: "peach", emoji: "🍑", voice_commands: ["peach", "peaches", "juicy peach"]},
    %{type: :pineapple, name: "pineapple", emoji: "🍍", voice_commands: ["pineapple", "tropical pineapple"]},
    %{type: :watermelon, name: "watermelon", emoji: "🍉", voice_commands: ["watermelon", "water melon", "summer melon"]},
    %{type: :lemon, name: "lemon", emoji: "🍋", voice_commands: ["lemon", "lemons", "yellow lemon"]},
    %{type: :avocado, name: "avocado", emoji: "🥑", voice_commands: ["avocado", "avocados", "green avocado"]},
    %{type: :coconut, name: "coconut", emoji: "🥥", voice_commands: ["coconut", "coconuts", "tropical coconut"]},
    %{type: :mango, name: "mango", emoji: "🥭", voice_commands: ["mango", "mangos", "tropical mango"]},
    %{type: :kiwi, name: "kiwi", emoji: "🥝", voice_commands: ["kiwi", "kiwis", "kiwi fruit"]},
    %{type: :tomato, name: "tomato", emoji: "🍅", voice_commands: ["tomato", "tomatoes", "red tomato"]},
    %{type: :carrot, name: "carrot", emoji: "🥕", voice_commands: ["carrot", "carrots", "orange carrot"]},
    %{type: :bread, name: "bread", emoji: "🍞", voice_commands: ["bread", "loaf", "fresh bread"]},
    %{type: :milk, name: "milk", emoji: "🥛", voice_commands: ["milk", "glass of milk", "white milk"]},
    %{type: :cheese, name: "cheese", emoji: "🧀", voice_commands: ["cheese", "yellow cheese", "block of cheese"]},
    %{type: :egg, name: "egg", emoji: "🥚", voice_commands: ["egg", "eggs", "white egg"]}
  ]

  # All available introduction items/concepts (matching tutorial vocabulary)
  @all_introduction_items [
    %{type: :hello, name: "hello", emoji: "👋", voice_commands: ["hello", "hi", "hey there"]},
    %{type: :name, name: "name", emoji: "📛", voice_commands: ["name", "my name", "called"]},
    %{type: :nice_to_meet, name: "nice to meet you", emoji: "🤝", voice_commands: ["nice to meet", "pleased to meet", "good to meet"]},
    %{type: :how_are_you, name: "how are you", emoji: "😊", voice_commands: ["how are you", "how you doing", "how's it going"]},
    %{type: :fine, name: "fine", emoji: "👌", voice_commands: ["fine", "good", "im fine", "doing well"]},
    %{type: :thank_you, name: "thank you", emoji: "🙏", voice_commands: ["thank you", "thanks", "thank you very much"]},
    %{type: :please, name: "please", emoji: "🥺", voice_commands: ["please", "if you please", "kindly"]},
    %{type: :excuse_me, name: "excuse me", emoji: "🙋", voice_commands: ["excuse me", "pardon me", "sorry to bother"]},
    %{type: :sorry, name: "sorry", emoji: "😔", voice_commands: ["sorry", "im sorry", "apologize"]},
    %{type: :yes, name: "yes", emoji: "✅", voice_commands: ["yes", "yeah", "yep", "correct"]},
    %{type: :no, name: "no", emoji: "❌", voice_commands: ["no", "nope", "not really", "incorrect"]},
    %{type: :goodbye, name: "goodbye", emoji: "👋", voice_commands: ["goodbye", "bye", "farewell"]},
    %{type: :see_you_later, name: "see you later", emoji: "🔄", voice_commands: ["see you later", "catch you later", "talk soon"]},
    %{type: :where, name: "where", emoji: "📍", voice_commands: ["where", "where is", "location"]},
    %{type: :from, name: "from", emoji: "🏠", voice_commands: ["from", "come from", "originally from"]}
  ]

  # All available numbers items (matching tutorial vocabulary)
  @all_numbers_items [
    %{type: :one, name: "one", emoji: "1️⃣", voice_commands: ["one", "number one", "first"]},
    %{type: :two, name: "two", emoji: "2️⃣", voice_commands: ["two", "number two", "second"]},
    %{type: :three, name: "three", emoji: "3️⃣", voice_commands: ["three", "number three", "third"]},
    %{type: :four, name: "four", emoji: "4️⃣", voice_commands: ["four", "number four", "fourth"]},
    %{type: :five, name: "five", emoji: "5️⃣", voice_commands: ["five", "number five", "fifth"]},
    %{type: :six, name: "six", emoji: "6️⃣", voice_commands: ["six", "number six", "sixth"]},
    %{type: :seven, name: "seven", emoji: "7️⃣", voice_commands: ["seven", "number seven", "seventh"]},
    %{type: :eight, name: "eight", emoji: "8️⃣", voice_commands: ["eight", "number eight", "eighth"]},
    %{type: :nine, name: "nine", emoji: "9️⃣", voice_commands: ["nine", "number nine", "ninth"]},
    %{type: :ten, name: "ten", emoji: "🔟", voice_commands: ["ten", "number ten", "tenth"]}
  ]

  # All available color items (matching tutorial vocabulary)
  @all_colors_items [
    %{type: :red, name: "red", emoji: "🔴", voice_commands: ["red", "red color", "the color red"]},
    %{type: :blue, name: "blue", emoji: "🔵", voice_commands: ["blue", "blue color", "the color blue"]},
    %{type: :green, name: "green", emoji: "🟢", voice_commands: ["green", "green color", "the color green"]},
    %{type: :yellow, name: "yellow", emoji: "🟡", voice_commands: ["yellow", "yellow color", "the color yellow"]},
    %{type: :orange, name: "orange", emoji: "🟠", voice_commands: ["orange", "orange color", "the color orange"]},
    %{type: :purple, name: "purple", emoji: "🟣", voice_commands: ["purple", "purple color", "the color purple"]},
    %{type: :pink, name: "pink", emoji: "🩷", voice_commands: ["pink", "pink color", "the color pink"]},
    %{type: :brown, name: "brown", emoji: "🤎", voice_commands: ["brown", "brown color", "the color brown"]},
    %{type: :black, name: "black", emoji: "⚫", voice_commands: ["black", "black color", "the color black"]},
    %{type: :white, name: "white", emoji: "⚪", voice_commands: ["white", "white color", "the color white"]},
    %{type: :gray, name: "gray", emoji: "🩶", voice_commands: ["gray", "gray color", "the color gray"]}
  ]

  @doc """
  Creates a new world with default 6x6 grid
  """
  def new(width \\ 6, height \\ 6, topic \\ "fruits") do
    grid = generate_default_map(width, height)
    player_pos = {1, 1}  # Start at position (1,1)
    
    # Generate items based on topic
    {grid_with_items, items} = case topic do
      "introduction" -> 
        # Randomly select 4-7 introduction concepts from all available items
        num_concepts = Enum.random(4..7)
        selected_concepts = @all_introduction_items |> Enum.shuffle() |> Enum.take(num_concepts)
        place_random_items(grid, width, height, player_pos, selected_concepts)
      "fruits" -> 
        # Randomly select 4-8 fruits/foods from all available items
        num_fruits = Enum.random(4..8)
        selected_fruits = @all_fruits_items |> Enum.shuffle() |> Enum.take(num_fruits)
        place_random_items(grid, width, height, player_pos, selected_fruits)
      "numbers" -> 
        # Randomly select 3-6 numbers from all available numbers
        num_numbers = Enum.random(3..6)
        selected_numbers = @all_numbers_items |> Enum.shuffle() |> Enum.take(num_numbers)
        place_random_items(grid, width, height, player_pos, selected_numbers)
      "colors" -> 
        # Randomly select 3-8 colors from all available colors
        num_colors = Enum.random(3..8)
        selected_colors = @all_colors_items |> Enum.shuffle() |> Enum.take(num_colors)
        place_random_items(grid, width, height, player_pos, selected_colors)
      _ -> place_random_items(grid, width, height, player_pos, @all_fruits_items)  # Default to fruits
    end
    
    # Generate cards based on actual items in world
    cards = BobaTalkie.Game.Card.generate_deck(items, topic)
    
    %__MODULE__{
      grid: grid_with_items,
      width: width,
      height: height,
      player_pos: player_pos,
      items: items,
      cards: cards
    }
  end

  @doc """
  Generates a simple test map with walls around borders
  """
  def generate_default_map(width, height) do
    for y <- 0..(height - 1) do
      for x <- 0..(width - 1) do
        cond do
          # Borders are walls
          x == 0 or x == width - 1 or y == 0 or y == height - 1 -> 0
          # Some internal walls for testing (adjusted for 6x6 grid)
          (x == 3 and y == 2) -> 0
          (x == 2 and y == 4) -> 0
          # Everything else is walkable (fruits will be placed separately)
          true -> 1
        end
      end
    end
  end

  @doc """
  Attempts to move player in given direction.
  Returns {:ok, new_world} or {:error, reason}
  """
  def move_player(world, direction) do
    {x, y} = world.player_pos
    
    new_pos = case direction do
      :north -> {x, y - 1}
      :south -> {x, y + 1}
      :east -> {x + 1, y}
      :west -> {x - 1, y}
      _ -> {x, y}
    end
    
    case can_move_to?(world, new_pos) do
      true -> 
        # Just update player position - don't modify grid as we handle display in UI
        new_world = %{world | player_pos: new_pos}
        {:ok, new_world}
      
      false -> 
        {:error, "Cannot move to #{inspect(new_pos)} - blocked"}
    end
  end

  @doc """
  Gets the cell value at given position
  """
  def get_cell(world, {x, y}) do
    if in_bounds?(world, {x, y}) do
      world.grid |> Enum.at(y) |> Enum.at(x)
    else
      0  # Out of bounds treated as wall
    end
  end

  @doc """
  Describes what's around the player (for voice feedback)
  """
  def describe_surroundings(world) do
    {x, y} = world.player_pos
    
    directions = [
      north: get_cell(world, {x, y - 1}),
      south: get_cell(world, {x, y + 1}),
      east: get_cell(world, {x + 1, y}),
      west: get_cell(world, {x - 1, y})
    ]
    
    Enum.map(directions, fn {dir, cell} ->
      description = case cell do
        0 -> "wall"
        1 -> "open path"
        3 -> 
          # Check if there's an item at this position
          pos = case dir do
            :north -> {x, y - 1}
            :south -> {x, y + 1} 
            :east -> {x + 1, y}
            :west -> {x - 1, y}
          end
          case Map.get(world.items, pos) do
            %{name: name} -> "#{name}"
            _ -> "item"
          end
        _ -> "unknown"
      end
      
      "#{dir}: #{description}"
    end)
  end

  @doc """
  Tries to complete a card challenge at current position by voice command.
  Returns {:ok, new_world, completed_card} or {:error, reason}
  """
  def complete_card_challenge(world, voice_command) do
    current_pos = world.player_pos
    
    case Map.get(world.items, current_pos) do
      nil -> 
        {:error, "No object here to interact with"}
      
      item ->
        # Get the currently selected card
        case BobaTalkie.Game.Card.get_selected_card(world.cards) do
          nil ->
            {:error, "Please select a card first by clicking on it"}
          
          selected_card ->
            # Check if voice command matches the card template for this object
            if BobaTalkie.Game.Card.matches_card?(selected_card, voice_command, item.type) do
              # Complete the card and remove the item
              new_cards = BobaTalkie.Game.Card.complete_card(world.cards, selected_card.id)
              new_grid = set_cell(world.grid, current_pos, 1)  # Set back to walkable
              new_items = Map.delete(world.items, current_pos)
              
              new_world = %{world | grid: new_grid, items: new_items, cards: new_cards}
              {:ok, new_world, selected_card}
            else
              expected = String.replace(selected_card.template, "_", item.name)
              {:error, "Try saying: '#{expected}' while standing on the #{item.name}"}
            end
        end
    end
  end

  @doc """
  Select a card for the challenge
  """
  def select_card(world, card_id) do
    new_cards = BobaTalkie.Game.Card.select_card(world.cards, card_id)
    %{world | cards: new_cards}
  end

  @doc """
  Check if all cards are completed (game finished)
  """
  def game_completed?(world) do
    BobaTalkie.Game.Card.all_completed?(world.cards)
  end

  @doc """
  Get game progress
  """
  def get_progress(world) do
    BobaTalkie.Game.Card.get_progress(world.cards)
  end

  @doc """
  Gets item at current player position, if any
  """
  def get_current_item(world) do
    Map.get(world.items, world.player_pos)
  end

  @doc """
  Gets all available fruits (for reference)
  """
  def get_available_fruits(), do: @all_fruits_items

  @doc """
  Gets all available introduction items (for reference)
  """
  def get_available_introduction_items(), do: @introduction_items

  @doc """
  Gets available items for a given topic
  """
  def get_available_items_for_topic(topic) do
    case topic do
      "introduction" -> @all_introduction_items
      "fruits" -> @all_fruits_items
      "numbers" -> @all_numbers_items
      "colors" -> @all_colors_items
      _ -> @all_fruits_items
    end
  end

  @doc """
  Gets all available numbers items (for reference)
  """
  def get_available_numbers_items(), do: @all_numbers_items

  @doc """
  Gets all available colors items (for reference)
  """
  def get_available_colors_items(), do: @all_colors_items

  # Private functions

  defp can_move_to?(world, pos) do
    case get_cell(world, pos) do
      0 -> false  # Wall
      2 -> false  # Player (shouldn't happen)
      _ -> true   # Walkable or item
    end
  end

  defp in_bounds?(world, {x, y}) do
    x >= 0 and x < world.width and y >= 0 and y < world.height
  end


  defp set_cell(grid, {x, y}, value) do
    grid
    |> List.update_at(y, fn row ->
      List.replace_at(row, x, value)
    end)
  end

  defp place_random_items(grid, width, height, player_pos, item_templates) do
    # Find all walkable positions (excluding player start)
    walkable_positions = for y <- 1..(height - 2),
                             x <- 1..(width - 2),
                             get_grid_cell(grid, {x, y}) == 1,
                             {x, y} != player_pos,
                             do: {x, y}
    
    # Randomly select positions for items (3-4 items for 6x6 grid)
    num_items = Enum.random(3..4)
    item_positions = walkable_positions
                     |> Enum.shuffle()
                     |> Enum.take(num_items)
    
    # Place items on grid and create items map
    {new_grid, items_map} = 
      item_positions
      |> Enum.with_index()
      |> Enum.reduce({grid, %{}}, fn {{x, y}, index}, {acc_grid, acc_items} ->
        # Pick a random item type from templates
        item_template = Enum.at(item_templates, rem(index, length(item_templates)))
        
        # Create item
        item = Map.put(item_template, :id, "#{item_template.type}_#{x}_#{y}")
        
        # Place on grid and add to items
        updated_grid = set_cell(acc_grid, {x, y}, 3)
        updated_items = Map.put(acc_items, {x, y}, item)
        
        {updated_grid, updated_items}
      end)
    
    {new_grid, items_map}
  end

  defp get_grid_cell(grid, {x, y}) do
    grid |> Enum.at(y) |> Enum.at(x)
  end

end