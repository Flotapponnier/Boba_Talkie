defmodule BobaTalkie.Voice.Deepgram.ErrorHandler do
  @moduledoc """
  Handles errors from Deepgram API and provides appropriate responses.
  """

  alias BobaTalkie.Utils.DebugLogger

  @doc """
  Handle HTTP response errors from Deepgram API
  """
  def handle_http_error(status_code, body) do
    error_details = parse_error_body(body)
    
    case status_code do
      400 -> 
        DebugLogger.error("Bad request to Deepgram", error_details, :voice, %{status_code: status_code})
        {:error, "Invalid audio format or request"}
      
      401 ->
        DebugLogger.error("Unauthorized Deepgram request", error_details, :voice, %{status_code: status_code})
        {:error, "Invalid API key"}
      
      402 ->
        DebugLogger.error("Payment required for Deepgram", error_details, :voice, %{status_code: status_code})
        {:error, "Insufficient credits"}
      
      403 ->
        DebugLogger.error("Forbidden Deepgram request", error_details, :voice, %{status_code: status_code})
        {:error, "Access forbidden"}
      
      429 ->
        DebugLogger.warn("Rate limit exceeded for Deepgram", :voice, %{error: error_details, status_code: status_code})
        {:error, "Rate limit exceeded"}
      
      500..599 ->
        DebugLogger.error("Deepgram server error", error_details, :voice, %{status_code: status_code})
        {:error, "Server error"}
      
      _ ->
        DebugLogger.error("Unknown Deepgram error", error_details, :voice, %{status_code: status_code})
        {:error, "API error: #{status_code}"}
    end
  end

  @doc """
  Handle network/connection errors
  """
  def handle_network_error(reason) do
    case reason do
      :timeout ->
        DebugLogger.error("Deepgram request timed out", nil, :voice)
        {:error, "Request timed out"}
      
      :econnrefused ->
        DebugLogger.error("Connection refused by Deepgram", nil, :voice)
        {:error, "Connection refused"}
      
      :nxdomain ->
        DebugLogger.error("DNS resolution failed for Deepgram", nil, :voice)
        {:error, "DNS resolution failed"}
      
      _ ->
        DebugLogger.error("Network error connecting to Deepgram", reason, :voice)
        {:error, "Network error: #{inspect(reason)}"}
    end
  end

  @doc """
  Handle audio processing errors
  """
  def handle_audio_error(error_type) do
    case error_type do
      :invalid_format ->
        DebugLogger.error("Invalid audio format", nil, :voice)
        {:error, "Audio format not supported"}
      
      :too_large ->
        DebugLogger.error("Audio file too large", nil, :voice)
        {:error, "Audio file too large"}
      
      :too_short ->
        DebugLogger.error("Audio file too short", nil, :voice)
        {:error, "Audio too short to process"}
      
      :corrupted ->
        DebugLogger.error("Corrupted audio data", nil, :voice)
        {:error, "Audio data corrupted"}
      
      _ ->
        DebugLogger.error("Unknown audio processing error", error_type, :voice)
        {:error, "Audio processing error"}
    end
  end

  @doc """
  Check if error is retryable
  """
  def retryable_error?(error) do
    case error do
      {:error, "Request timed out"} -> true
      {:error, "Rate limit exceeded"} -> true
      {:error, "Server error"} -> true
      {:error, "Connection refused"} -> true
      {:error, "DNS resolution failed"} -> false
      {:error, "Invalid API key"} -> false
      {:error, "Insufficient credits"} -> false
      _ -> false
    end
  end

  @doc """
  Get retry delay based on error type
  """
  def get_retry_delay(error, attempt \\ 1) do
    base_delay = case error do
      {:error, "Rate limit exceeded"} -> 2000  # 2 seconds
      {:error, "Server error"} -> 1000        # 1 second
      {:error, "Request timed out"} -> 500    # 0.5 seconds
      _ -> 1000
    end
    
    # Exponential backoff
    base_delay * :math.pow(2, attempt - 1)
    |> round()
    |> min(30000)  # Max 30 seconds
  end

  # Private functions

  defp parse_error_body(body) do
    case Jason.decode(body) do
      {:ok, %{"error" => error_info}} -> error_info
      {:ok, json} -> json
      _ -> %{raw_body: body}
    end
  end
end