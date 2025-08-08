defmodule BobaTalkie.Game.World do
  @moduledoc """
  Manages the 2D grid world state and logic.
  
  Grid cell values:
  - 0: Wall/obstacle (impassable)
  - 1: Empty walkable space
  - 2: Player position
  - 3: Interactive item/object
  """

  defstruct [:grid, :width, :height, :player_pos, :items]

  @type cell_type :: 0..3
  @type position :: {integer(), integer()}
  
  @type t :: %__MODULE__{
    grid: [[cell_type()]],
    width: integer(),
    height: integer(),
    player_pos: position(),
    items: %{position() => map()}
  }

  @doc """
  Creates a new world with default 10x10 grid
  """
  def new(width \\ 10, height \\ 10) do
    grid = generate_default_map(width, height)
    player_pos = {1, 1}  # Start at position (1,1)
    
    %__MODULE__{
      grid: set_cell(grid, player_pos, 2),
      width: width,
      height: height,
      player_pos: player_pos,
      items: %{}
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
          # Some internal walls for testing
          (x == 3 and y in [2, 3, 4]) -> 0
          (x == 7 and y in [5, 6, 7]) -> 0
          # Place some items
          (x == 5 and y == 2) -> 3
          (x == 8 and y == 8) -> 3
          # Everything else is walkable
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
        new_world = world
        |> clear_player_position()
        |> set_player_position(new_pos)
        
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
        3 -> "item"
        _ -> "unknown"
      end
      
      "#{dir}: #{description}"
    end)
  end

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

  defp clear_player_position(world) do
    {x, y} = world.player_pos
    new_grid = set_cell(world.grid, {x, y}, 1)
    %{world | grid: new_grid}
  end

  defp set_player_position(world, new_pos) do
    new_grid = set_cell(world.grid, new_pos, 2)
    %{world | grid: new_grid, player_pos: new_pos}
  end

  defp set_cell(grid, {x, y}, value) do
    grid
    |> List.update_at(y, fn row ->
      List.replace_at(row, x, value)
    end)
  end
end