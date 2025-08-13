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
  @fruits [
    %{type: :apple, name: "apple", emoji: "🍎", voice_commands: ["apple", "red apple"]},
    %{type: :banana, name: "banana", emoji: "🍌", voice_commands: ["banana", "yellow banana"]},
    %{type: :orange, name: "orange", emoji: "🍊", voice_commands: ["orange", "orange fruit"]},
    %{type: :grape, name: "grape", emoji: "🍇", voice_commands: ["grape", "grapes", "purple grape"]}
  ]

  # Available introduction items/concepts
  @introduction_items [
    %{type: :hello, name: "hello", emoji: "👋", voice_commands: ["hello", "hi", "hey there"]},
    %{type: :name, name: "name", emoji: "📛", voice_commands: ["name", "my name", "called"]},
    %{type: :nice_to_meet, name: "nice to meet you", emoji: "🤝", voice_commands: ["nice to meet", "pleased to meet", "good to meet"]},
    %{type: :thank_you, name: "thank you", emoji: "🙏", voice_commands: ["thank you", "thanks", "thank you very much"]}
  ]

  # Available numbers items
  @numbers_items [
    %{type: :one, name: "one", emoji: "1️⃣", voice_commands: ["one", "number one", "first"]},
    %{type: :two, name: "two", emoji: "2️⃣", voice_commands: ["two", "number two", "second"]},
    %{type: :three, name: "three", emoji: "3️⃣", voice_commands: ["three", "number three", "third"]},
    %{type: :four, name: "four", emoji: "4️⃣", voice_commands: ["four", "number four", "fourth"]}
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
      "introduction" -> place_random_items(grid, width, height, player_pos, @introduction_items)
      "fruits" -> place_random_items(grid, width, height, player_pos, @fruits)
      "numbers" -> place_random_items(grid, width, height, player_pos, @numbers_items)
      "colors" -> 
        # Randomly select 3-8 colors from all available colors
        num_colors = Enum.random(3..8)
        selected_colors = @all_colors_items |> Enum.shuffle() |> Enum.take(num_colors)
        place_random_items(grid, width, height, player_pos, selected_colors)
      _ -> place_random_items(grid, width, height, player_pos, @fruits)  # Default to fruits
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
  def get_available_fruits(), do: @fruits

  @doc """
  Gets all available introduction items (for reference)
  """
  def get_available_introduction_items(), do: @introduction_items

  @doc """
  Gets available items for a given topic
  """
  def get_available_items_for_topic(topic) do
    case topic do
      "introduction" -> @introduction_items
      "fruits" -> @fruits
      "numbers" -> @numbers_items
      "colors" -> @all_colors_items
      _ -> @fruits
    end
  end

  @doc """
  Gets all available numbers items (for reference)
  """
  def get_available_numbers_items(), do: @numbers_items

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