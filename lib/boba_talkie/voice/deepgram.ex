defmodule BobaTalkie.Voice.Deepgram do
  @moduledoc """
  Deepgram API integration for speech-to-text.
  Used as fallback when Web Speech API is not available.
  """
  
  require Logger
  alias BobaTalkie.Utils.DebugLogger
  alias BobaTalkie.Voice.Deepgram.{ResponseParser, ErrorHandler}
  
  @deepgram_url "https://api.deepgram.com/v1/listen"
  
  @doc """
  Transcribe audio using Deepgram API
  """
  def transcribe_audio(audio_data, mime_type \\ "audio/webm") when is_binary(audio_data) do
    DebugLogger.voice_debug("Starting Deepgram transcription", %{
      audio_size: byte_size(audio_data),
      mime_type: mime_type
    })
    
    case get_api_key() do
      nil -> 
        error_msg = "Deepgram API key not configured"
        DebugLogger.error(error_msg, nil, :voice)
        {:error, error_msg}
      
      api_key ->
        # Convert browser mime types to Deepgram-compatible ones
        content_type = normalize_mime_type(mime_type)
        
        DebugLogger.voice_debug("API key found, preparing request", %{
          original_mime: mime_type,
          content_type: content_type
        })
        
        headers = [
          {"Authorization", "Token #{api_key}"},
          {"Content-Type", content_type}
        ]
        
        query_params = URI.encode_query(%{
          "model" => "nova-2",
          "language" => "en-US",
          "smart_format" => "true",
          "punctuate" => "true"
        })
        
        url = "#{@deepgram_url}?#{query_params}"
        
        DebugLogger.voice_debug("Sending request to Deepgram", %{
          url: url, 
          audio_size: byte_size(audio_data),
          headers: headers,
          first_bytes: binary_part(audio_data, 0, min(16, byte_size(audio_data))) |> Base.encode16()
        })
        
        case HTTPoison.post(url, audio_data, headers, timeout: 5_000) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            DebugLogger.voice_debug("Deepgram response received successfully")
            result = ResponseParser.parse_response(body)
            DebugLogger.voice_debug("Transcription completed", %{result: result})
            result
          
          {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
            ErrorHandler.handle_http_error(status_code, body)
          
          {:error, %HTTPoison.Error{reason: reason}} ->
            ErrorHandler.handle_network_error(reason)
        end
    end
  end
  
  # Removed: function moved to ResponseParser module
  
  defp get_api_key do
    System.get_env("DEEPGRAM_API_KEY") || Application.get_env(:boba_talkie, :deepgram_api_key)
  end
  
  defp normalize_mime_type(mime_type) do
    case mime_type do
      # Browser formats to Deepgram-compatible formats
      "audio/wav" -> "audio/wav"
      "audio/webm" -> "audio/webm"
      "audio/webm;codecs=opus" -> "audio/webm"
      "audio/webm;codecs=pcm" -> "audio/webm" 
      "audio/mp4" -> "audio/mp4"
      "audio/mp4;codecs=mp4a.40.2" -> "audio/mp4"
      "audio/mpeg" -> "audio/mpeg"
      # For empty/unknown, try wav which is most compatible
      "" -> "audio/wav"
      # Default fallback
      _ -> "audio/webm"
    end
  end
end