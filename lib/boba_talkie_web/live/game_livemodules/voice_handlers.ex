defmodule BobaTalkieWeb.GameLive.VoiceHandlers do
  @moduledoc """
  Voice-related event handlers for GameLive.
  Handles voice capture, transcription, and command processing.
  """

  alias BobaTalkie.Voice.Deepgram
  alias BobaTalkie.Utils.DebugLogger
  
  @doc """
  Handle start listening event
  """
  def handle_start_listening(socket) do
    DebugLogger.voice_debug("Starting voice capture")
    assign(socket, :listening, true)
  end

  @doc """
  Handle stop listening event
  """
  def handle_stop_listening(socket) do
    socket
    |> assign(:listening, false)
    |> assign(:interim_text, nil)
  end

  @doc """
  Handle interim voice text updates
  """
  def handle_voice_interim(socket, text) do
    DebugLogger.voice_debug("Interim voice text", %{text: text})
    assign(socket, :interim_text, text)
  end

  @doc """
  Handle voice recognition errors
  """
  def handle_voice_error(socket, error) do
    DebugLogger.error("Voice recognition error", error, :voice)
    
    socket
    |> assign(:listening, false)
    |> assign(:interim_text, nil)
    |> add_game_message("Voice error: #{error}")
  end

  @doc """
  Handle voice audio data from MediaRecorder
  """
  def handle_voice_audio(socket, audio_params, live_view_pid) do
    learning_language = socket.assigns[:learning_language] || "en"
    require Logger
    Logger.info("VoiceHandlers: learning_language from socket.assigns = #{learning_language}")
    Logger.info("VoiceHandlers: all socket assigns = #{inspect(Map.keys(socket.assigns))}")
    DebugLogger.voice_debug("Using learning language for voice recognition", %{learning_language: learning_language})
    
    {audio_base64, mime_type} = case audio_params do
      %{"audio" => audio, "mime_type" => mime, "size" => size} ->
        DebugLogger.voice_debug("Received voice audio data", %{
          base64_size: String.length(audio), 
          mime_type: mime, 
          blob_size: size
        })
        {audio, mime}
      
      # Fallback for old format
      audio when is_binary(audio) ->
        DebugLogger.voice_debug("Received voice audio data (legacy format)", %{size: String.length(audio)})
        {audio, "audio/webm"}
    end
    
    case Base.decode64(audio_base64) do
      {:ok, audio_data} ->
        DebugLogger.voice_debug("Audio decoded successfully", %{decoded_size: byte_size(audio_data)})
        
        # Process with Deepgram in background using learning language
        task = Task.async(fn -> 
          Deepgram.transcribe_audio(audio_data, mime_type, learning_language) 
        end)
        
        case Task.await(task, 5000) do
          {:ok, %{text: text, confidence: confidence}} ->
            DebugLogger.voice_debug("Transcription successful", %{text: text, confidence: confidence})
            # Send result back to LiveView process
            send(live_view_pid, {:voice_result, text, confidence})
            {:ok, socket}
          
          {:error, reason} ->
            DebugLogger.error("Transcription failed", reason, :voice)
            error_socket = 
              socket
              |> assign(:listening, false)
              |> assign(:interim_text, nil)
              |> add_game_message("Transcription failed: #{reason}")
            
            {:error, error_socket}
        end
      
      :error ->
        DebugLogger.error("Failed to decode audio data", nil, :voice)
        error_socket = add_game_message(socket, "Invalid audio data")
        {:error, error_socket}
    end
  end

  @doc """
  Handle Deepgram streaming fallback - shows text input mode
  """
  def handle_start_deepgram_stream(socket, _live_view_pid) do
    DebugLogger.voice_debug("Starting text input fallback for voice recognition")
    
    socket
    |> assign(:listening, false)
    |> assign(:text_input_mode, true)
    |> add_game_message("Voice recognition unavailable. Use the text input below or try a different browser (Chrome recommended).")
  end

  @doc """
  Handle async voice transcription results
  """
  def handle_voice_result(socket, command, confidence, world, player) do
    learning_language = socket.assigns[:learning_language] || "en"
    DebugLogger.voice_debug("Processing async voice result", %{command: command, confidence: confidence, learning_language: learning_language})
    
    # Process the transcribed command using movement handlers with learning language
    {new_world, new_player, message} = BobaTalkieWeb.GameLive.MovementHandlers.process_command(
      world, 
      player, 
      command,
      confidence,
      learning_language
    )

    socket
    |> assign(:world, new_world)
    |> assign(:player, new_player)
    |> assign(:last_command, command)
    |> assign(:interim_text, nil)
    |> add_game_message(message)
    |> assign(:listening, false)
  end

  # Private helper functions
  defp add_game_message(socket, message) do
    BobaTalkieWeb.GameLive.StateManager.add_game_message(socket, message)
  end

  defp assign(socket, key, value) do
    Phoenix.Component.assign(socket, key, value)
  end
end