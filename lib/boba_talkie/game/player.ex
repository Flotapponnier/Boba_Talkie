defmodule BobaTalkie.Game.Player do
  @moduledoc """
  Manages player state and actions within the game world.
  """

  defstruct [:name, :position, :inventory, :stats]

  @type t :: %__MODULE__{
    name: String.t(),
    position: {integer(), integer()},
    inventory: [map()],
    stats: %{
      commands_spoken: integer(),
      pronunciation_score: float(),
      time_played: integer()
    }
  }

  @doc """
  Creates a new player at starting position
  """
  def new(name \\ "Player", starting_pos \\ {1, 1}) do
    %__MODULE__{
      name: name,
      position: starting_pos,
      inventory: [],
      stats: %{
        commands_spoken: 0,
        pronunciation_score: 0.0,
        time_played: 0
      }
    }
  end

  @doc """
  Updates player position (called after successful move)
  """
  def update_position(player, new_position) do
    %{player | position: new_position}
  end

  @doc """
  Records a voice command attempt for learning analytics
  """
  def record_voice_command(player, _command, confidence_score) do
    new_stats = player.stats
    |> Map.update!(:commands_spoken, &(&1 + 1))
    |> Map.update!(:pronunciation_score, fn current_score ->
      # Running average of pronunciation confidence
      total_commands = player.stats.commands_spoken + 1
      ((current_score * player.stats.commands_spoken) + confidence_score) / total_commands
    end)

    %{player | stats: new_stats}
  end

  @doc """
  Adds an item to player inventory
  """
  def add_to_inventory(player, item) do
    %{player | inventory: [item | player.inventory]}
  end

  @doc """
  Gets player's current stats for display
  """
  def get_stats(player) do
    %{
      name: player.name,
      position: player.position,
      commands_spoken: player.stats.commands_spoken,
      pronunciation_score: Float.round(player.stats.pronunciation_score * 100, 1),
      items_collected: length(player.inventory)
    }
  end
end