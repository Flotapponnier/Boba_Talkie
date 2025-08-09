defmodule BobaTalkieWeb.GameLive.UIHelpers do
  @moduledoc """
  UI helper functions for GameLive templates.
  Contains functions for rendering game elements and styling.
  """

  @doc """
  Returns CSS class for different cell types in the game grid
  """
  def cell_class(cell, world \\ nil, position \\ nil) do
    # Check if player is on an item for special highlighting
    player_on_item = world && position && world.player_pos == position && Map.has_key?(world.items, position)
    
    base_class = case cell do
      0 -> "bg-gray-800 border-gray-700"      # Wall
      1 -> "bg-green-500 border-green-400"    # Empty walkable
      2 -> "bg-blue-500 border-blue-400"      # Player
      3 -> "bg-yellow-500 border-yellow-400"  # Item
      _ -> "bg-gray-600 border-gray-500"      # Unknown
    end
    
    # Add special highlighting when player is on an item
    if player_on_item do
      "bg-gradient-to-br from-blue-400 to-yellow-400 border-purple-300 ring-2 ring-purple-400 ring-opacity-50"
    else
      base_class
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
  def listening_indicator(true), do: "🟢"
  def listening_indicator(false), do: "⚫"

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
end