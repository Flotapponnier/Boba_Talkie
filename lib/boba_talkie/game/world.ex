defmodule BobaTalkie.Game.World do
  @moduledoc """
  Manages the 2D grid world state and logic.
  
  Grid cell values:
  - 0: Wall/obstacle (impassable)
  - 1: Empty walkable space
  - 2: Player position
  - 3: Interactive item/object (fruit)
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

  @doc """
  Creates a new world with default 6x6 grid
  """
  def new(width \\ 6, height \\ 6) do
    grid = generate_default_map(width, height)
    player_pos = {1, 1}  # Start at position (1,1)
    
    # Generate fruits and place them on the map
    {grid_with_fruits, fruit_items} = place_random_fruits(grid, width, height, player_pos)
    
    # Generate cards based on actual items in world
    cards = BobaTalkie.Game.Card.generate_deck(fruit_items)
    
    %__MODULE__{
      grid: grid_with_fruits,
      width: width,
      height: height,
      player_pos: player_pos,
      items: fruit_items,
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
          # Check if there's a fruit at this position
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
      
      fruit_item ->
        # Get the currently selected card
        case BobaTalkie.Game.Card.get_selected_card(world.cards) do
          nil ->
            {:error, "Please select a card first by clicking on it"}
          
          selected_card ->
            # Check if voice command matches the card template for this object
            if BobaTalkie.Game.Card.matches_card?(selected_card, voice_command, fruit_item.type) do
              # Complete the card and remove the fruit
              new_cards = BobaTalkie.Game.Card.complete_card(world.cards, selected_card.id)
              new_grid = set_cell(world.grid, current_pos, 1)  # Set back to walkable
              new_items = Map.delete(world.items, current_pos)
              
              new_world = %{world | grid: new_grid, items: new_items, cards: new_cards}
              {:ok, new_world, selected_card}
            else
              expected = String.replace(selected_card.template, "_", fruit_item.name)
              {:error, "Try saying: '#{expected}' while standing on the #{fruit_item.name}"}
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
  Gets fruit at current player position, if any
  """
  def get_current_fruit(world) do
    Map.get(world.items, world.player_pos)
  end

  @doc """
  Gets all available fruits (for reference)
  """
  def get_available_fruits(), do: @fruits

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

  defp place_random_fruits(grid, width, height, player_pos) do
    # Find all walkable positions (excluding player start)
    walkable_positions = for y <- 1..(height - 2),
                             x <- 1..(width - 2),
                             get_grid_cell(grid, {x, y}) == 1,
                             {x, y} != player_pos,
                             do: {x, y}
    
    # Randomly select positions for fruits (3-4 fruits for 6x6 grid)
    num_fruits = Enum.random(3..4)
    fruit_positions = walkable_positions
                     |> Enum.shuffle()
                     |> Enum.take(num_fruits)
    
    # Place fruits on grid and create items map
    {new_grid, items_map} = 
      fruit_positions
      |> Enum.with_index()
      |> Enum.reduce({grid, %{}}, fn {{x, y}, index}, {acc_grid, acc_items} ->
        # Pick a random fruit type
        fruit_template = Enum.at(@fruits, rem(index, length(@fruits)))
        
        # Create fruit item
        fruit_item = Map.put(fruit_template, :id, "#{fruit_template.type}_#{x}_#{y}")
        
        # Place on grid and add to items
        updated_grid = set_cell(acc_grid, {x, y}, 3)
        updated_items = Map.put(acc_items, {x, y}, fruit_item)
        
        {updated_grid, updated_items}
      end)
    
    {new_grid, items_map}
  end

  defp get_grid_cell(grid, {x, y}) do
    grid |> Enum.at(y) |> Enum.at(x)
  end

end