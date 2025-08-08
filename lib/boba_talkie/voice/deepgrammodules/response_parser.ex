defmodule BobaTalkie.Voice.Deepgram.ResponseParser do
  @moduledoc """
  Parses Deepgram API responses and extracts transcription data.
  """

  alias BobaTalkie.Utils.DebugLogger

  @doc """
  Parse Deepgram JSON response and extract transcription text and confidence
  """
  def parse_response(json_body) do
    DebugLogger.voice_debug("Parsing Deepgram response", %{body_length: String.length(json_body)})
    
    case Jason.decode(json_body) do
      {:ok, %{"results" => %{"channels" => [%{"alternatives" => [%{"transcript" => transcript, "confidence" => confidence} | _]} | _]}}} ->
        trimmed_transcript = String.trim(transcript)
        DebugLogger.voice_debug("Successfully parsed response", %{
          transcript: trimmed_transcript, 
          confidence: confidence
        })
        {:ok, %{text: trimmed_transcript, confidence: confidence}}
      
      {:ok, %{"results" => %{"channels" => [%{"alternatives" => []} | _]}}} ->
        DebugLogger.voice_debug("No speech detected in response")
        {:error, "No speech detected"}
      
      {:ok, response} ->
        DebugLogger.error("Unexpected response format", response, :voice)
        {:error, "Unexpected response format"}
      
      {:error, decode_error} ->
        DebugLogger.error("Failed to decode JSON response", decode_error, :voice)
        {:error, "Invalid JSON response"}
    end
  end

  @doc """
  Validate confidence score and provide feedback
  """
  def validate_confidence(confidence) when is_float(confidence) do
    cond do
      confidence >= 0.9 -> {:excellent, confidence}
      confidence >= 0.8 -> {:good, confidence}
      confidence >= 0.6 -> {:fair, confidence}
      confidence >= 0.4 -> {:poor, confidence}
      true -> {:very_poor, confidence}
    end
  end
  def validate_confidence(_), do: {:unknown, 0.0}

  @doc """
  Extract metadata from Deepgram response
  """
  def extract_metadata(json_body) do
    case Jason.decode(json_body) do
      {:ok, %{"metadata" => metadata}} ->
        %{
          request_id: Map.get(metadata, "request_id"),
          duration: Map.get(metadata, "duration"),
          model_info: Map.get(metadata, "model_info", %{}),
          channels: Map.get(metadata, "channels")
        }
      
      _ -> %{}
    end
  end

  @doc """
  Check if response indicates silence or no speech
  """
  def is_silence?(json_body) do
    case Jason.decode(json_body) do
      {:ok, %{"results" => %{"channels" => [%{"alternatives" => alternatives} | _]}}} ->
        Enum.empty?(alternatives) or
        Enum.all?(alternatives, fn alt -> 
          String.trim(Map.get(alt, "transcript", "")) == ""
        end)
      
      _ -> false
    end
  end
end