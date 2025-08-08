defmodule BobaTalkie.Utils.DebugLogger do
  @moduledoc """
  Environment-based debug logging utility for BobaTalkie.
  Provides configurable logging for different subsystems.
  """

  require Logger

  @doc """
  Log a debug message with optional subsystem filtering
  """
  def debug(message, subsystem \\ :general, metadata \\ []) do
    if debug_enabled?() and subsystem_enabled?(subsystem) do
      Logger.debug("[#{format_subsystem(subsystem)}] #{message}", metadata)
    end
  end

  @doc """
  Log info with optional subsystem filtering
  """
  def info(message, subsystem \\ :general, metadata \\ []) do
    if log_level_enabled?(:info) and subsystem_enabled?(subsystem) do
      Logger.info("[#{format_subsystem(subsystem)}] #{message}", metadata)
    end
  end

  @doc """
  Log warnings with subsystem context
  """
  def warn(message, subsystem \\ :general, metadata \\ []) do
    if log_level_enabled?(:warn) and subsystem_enabled?(subsystem) do
      Logger.warning("[#{format_subsystem(subsystem)}] #{message}", metadata)
    end
  end

  @doc """
  Log errors with optional detailed printing
  """
  def error(message, error \\ nil, subsystem \\ :general, metadata \\ []) do
    if log_level_enabled?(:error) do
      full_message = format_error_message(message, error)
      Logger.error("[#{format_subsystem(subsystem)}] #{full_message}", metadata)
      
      # Print detailed errors if enabled
      if print_errors_enabled?() and error do
        print_detailed_error(error)
      end
    end
  end

  @doc """
  Voice-specific debug logging
  """
  def voice_debug(message, metadata \\ []) do
    debug(message, :voice, metadata)
  end

  @doc """
  Game-specific debug logging
  """
  def game_debug(message, metadata \\ []) do
    debug(message, :game, metadata)
  end

  @doc """
  LiveView-specific debug logging
  """
  def live_debug(message, metadata \\ []) do
    debug(message, :live, metadata)
  end

  # Private functions

  defp debug_enabled? do
    case get_env("DEBUG_ENABLED") do
      "true" -> true
      _ -> Mix.env() == :dev
    end
  end

  defp log_level_enabled?(level) do
    current_level = get_debug_level()
    level_priority(level) >= level_priority(current_level)
  end

  defp get_debug_level do
    case get_env("DEBUG_LEVEL") do
      level when level in ["debug", "info", "warn", "error"] -> String.to_atom(level)
      _ -> :debug
    end
  end

  defp level_priority(:debug), do: 0
  defp level_priority(:info), do: 1
  defp level_priority(:warn), do: 2
  defp level_priority(:error), do: 3

  defp subsystem_enabled?(subsystem) do
    case subsystem do
      :voice -> voice_debug_enabled?()
      :game -> game_debug_enabled?()
      :live -> debug_enabled?()
      :general -> debug_enabled?()
      _ -> debug_enabled?()
    end
  end

  defp voice_debug_enabled? do
    case get_env("VOICE_DEBUG") do
      "true" -> true
      _ -> false
    end
  end

  defp game_debug_enabled? do
    case get_env("GAME_DEBUG") do
      "true" -> true
      _ -> false
    end
  end

  defp print_errors_enabled? do
    case get_env("PRINT_ERRORS") do
      "true" -> true
      _ -> Mix.env() == :dev
    end
  end

  defp format_subsystem(subsystem) do
    case subsystem do
      :voice -> "VOICE"
      :game -> "GAME"
      :live -> "LIVE"
      :general -> "APP"
      _ -> String.upcase(to_string(subsystem))
    end
  end

  defp format_error_message(message, nil), do: message
  defp format_error_message(message, error) when is_binary(error), do: "#{message}: #{error}"
  defp format_error_message(message, %{message: error_msg}), do: "#{message}: #{error_msg}"
  defp format_error_message(message, error), do: "#{message}: #{inspect(error)}"

  defp print_detailed_error(error) do
    if print_errors_enabled?() do
      IO.puts("\n--- DETAILED ERROR ---")
      IO.inspect(error, pretty: true, limit: :infinity)
      IO.puts("--- END ERROR ---\n")
    end
  end

  defp get_env(key) do
    System.get_env(key) || Application.get_env(:boba_talkie, String.to_atom(String.downcase(key)))
  end
end