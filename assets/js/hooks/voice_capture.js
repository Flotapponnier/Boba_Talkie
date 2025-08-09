export const VoiceCapture = {
  mounted() {
    this.isRecording = false;
    this.recognition = null;
    this.deepgramSocket = null;
    this.mediaStream = null;
    this.mediaRecorder = null;
    this.audioChunks = [];
    
    console.log('VoiceCapture mounted - Web Speech API with MediaRecorder fallback');
    
    // Detect Brave browser - be more specific
    this.isBrave = (navigator.brave && navigator.brave.isBrave) || 
                   navigator.userAgent.includes('Brave');
    
    // Check if Web Speech API is available
    this.hasWebSpeech = 'webkitSpeechRecognition' in window || 'SpeechRecognition' in window;
    
    console.log('Browser detection:', {
      isBrave: this.isBrave,
      hasWebSpeech: this.hasWebSpeech,
      willUseMediaRecorder: this.isBrave || !this.hasWebSpeech
    });
    
    // Initialize appropriate speech recognition method
    if (!this.isBrave && this.hasWebSpeech) {
      this.initWebSpeechAPI();
    }
    
    // Add event listeners for button interactions
    this.el.addEventListener('mousedown', (e) => {
      e.preventDefault();
      console.log('Mouse down - starting recording');
      this.startRecording();
    });
    
    this.el.addEventListener('mouseup', (e) => {
      e.preventDefault();
      console.log('Mouse up - stopping recording');
      this.stopRecording();
    });
    
    this.el.addEventListener('mouseleave', (e) => {
      e.preventDefault();
      console.log('Mouse leave - stopping recording');
      this.stopRecording();
    });
    
    this.el.addEventListener('touchstart', (e) => {
      e.preventDefault();
      console.log('Touch start - starting recording');
      this.startRecording();
    });
    
    this.el.addEventListener('touchend', (e) => {
      e.preventDefault();
      console.log('Touch end - stopping recording');
      this.stopRecording();
    });
    
    // Prevent context menu on long press
    this.el.addEventListener('contextmenu', (e) => e.preventDefault());
  },

  initWebSpeechAPI() {
    // Use Web Speech API for fastest results (may not work in Brave)
    if ('webkitSpeechRecognition' in window || 'SpeechRecognition' in window) {
      const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
      this.recognition = new SpeechRecognition();
      
      this.recognition.continuous = false;
      this.recognition.interimResults = true;
      this.recognition.lang = 'en-US';
      
      this.recognition.onresult = (event) => {
        // Clear timeout since we're getting results
        if (this.recordingTimeout) {
          clearTimeout(this.recordingTimeout);
          this.recordingTimeout = null;
        }
        
        let finalTranscript = '';
        let interimTranscript = '';
        
        for (let i = event.resultIndex; i < event.results.length; i++) {
          const transcript = event.results[i][0].transcript;
          if (event.results[i].isFinal) {
            finalTranscript += transcript;
          } else {
            interimTranscript += transcript;
          }
        }
        
        // Send interim results for real-time feedback
        if (interimTranscript) {
          this.pushEvent("voice_interim", { text: interimTranscript });
        }
        
        // Send final result
        if (finalTranscript) {
          const confidence = event.results[0][0].confidence || 0.9;
          console.log('Web Speech API result:', finalTranscript, 'confidence:', confidence);
          this.pushEvent("voice_command", { 
            command: finalTranscript.trim(),
            confidence: confidence
          });
        }
      };
      
      this.recognition.onerror = (event) => {
        console.warn('Speech recognition error, trying Deepgram fallback:', event.error);
        // Try Deepgram as fallback
        if (this.isRecording) {
          this.startDeepgramStreaming();
        }
      };
      
      this.recognition.onend = () => {
        console.log('Speech recognition ended');
        // Only stop if we're not trying Deepgram fallback
        if (this.isRecording && !this.deepgramSocket) {
          this.isRecording = false;
          this.updateButtonState(false);
          this.pushEvent("stop_listening", {});
        }
      };
    }
  },

  async startRecording() {
    if (this.isRecording) {
      console.log('Already recording, ignoring');
      return;
    }
    
    this.isRecording = true;
    this.updateButtonState(true);
    this.pushEvent("start_listening", {});
    
    if (this.isBrave || !this.hasWebSpeech) {
      // Use MediaRecorder for Brave or browsers without Web Speech API
      console.log('Starting MediaRecorder fallback...');
      await this.startMediaRecorder();
    } else {
      // Use Web Speech API for Chrome/others (fast, real-time)
      if (!this.recognition) {
        console.error('Web Speech API not available');
        this.pushEvent("voice_error", { error: "Speech recognition not available in this browser" });
        return;
      }
      
      console.log('Starting Web Speech API recording...');
      try {
        this.recognition.start();
      } catch (error) {
        console.error('Web Speech API failed to start:', error);
        this.isRecording = false;
        this.updateButtonState(false);
        this.pushEvent("voice_error", { error: `Failed to start speech recognition: ${error.message}` });
      }
    }
  },

  async startMediaRecorder() {
    try {
      // Get microphone access
      this.mediaStream = await navigator.mediaDevices.getUserMedia({
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true,
          sampleRate: 16000,
          channelCount: 1
        }
      });

      // Initialize MediaRecorder
      const options = {
        mimeType: 'audio/webm;codecs=opus',
        audioBitsPerSecond: 16000
      };
      
      // Fallback MIME types for compatibility
      if (!MediaRecorder.isTypeSupported(options.mimeType)) {
        if (MediaRecorder.isTypeSupported('audio/webm')) {
          options.mimeType = 'audio/webm';
        } else if (MediaRecorder.isTypeSupported('audio/mp4')) {
          options.mimeType = 'audio/mp4';
        } else {
          delete options.mimeType;
        }
      }

      this.mediaRecorder = new MediaRecorder(this.mediaStream, options);
      this.audioChunks = [];

      this.mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          this.audioChunks.push(event.data);
          console.log('Audio chunk received:', event.data.size, 'bytes');
        }
      };

      this.mediaRecorder.onstop = () => {
        console.log('MediaRecorder stopped, processing audio...');
        this.processRecordedAudio();
      };

      this.mediaRecorder.onerror = (error) => {
        console.error('MediaRecorder error:', error);
        this.pushEvent("voice_error", { error: `Recording failed: ${error.error}` });
      };

      // Start recording
      console.log('Starting MediaRecorder with MIME type:', options.mimeType || 'default');
      this.mediaRecorder.start();
      
      // Simulate interim text for MediaRecorder (since it can't provide real-time transcription)
      this.showInterimProgress();
      
    } catch (error) {
      console.error('Failed to start MediaRecorder:', error);
      this.isRecording = false;
      this.updateButtonState(false);
      this.pushEvent("voice_error", { error: `Microphone access failed: ${error.message}` });
    }
  },

  stopRecording() {
    if (!this.isRecording) {
      console.log('Not recording, ignoring stop');
      return;
    }
    
    console.log('Stopping recording...');
    this.isRecording = false;
    this.updateButtonState(false);
    
    // Clear interim progress for MediaRecorder
    this.clearInterimProgress();
    
    if ((this.isBrave || !this.hasWebSpeech) && this.mediaRecorder) {
      // Stop MediaRecorder for Brave/fallback
      if (this.mediaRecorder.state === 'recording') {
        console.log('Stopping MediaRecorder...');
        this.mediaRecorder.stop();
      }
    } else if (this.recognition) {
      // Stop Web Speech API for Chrome/others
      try {
        this.recognition.stop();
        console.log('Web Speech API stopped');
      } catch (error) {
        console.log('Error stopping recognition:', error);
      }
    }
    
    // Always notify the server that we stopped listening
    this.pushEvent("stop_listening", {});
  },

  async processRecordedAudio() {
    if (this.audioChunks.length === 0) {
      console.log('No audio chunks to process');
      return;
    }

    try {
      // Create audio blob from chunks
      const audioBlob = new Blob(this.audioChunks, { 
        type: this.mediaRecorder.mimeType || 'audio/webm' 
      });
      
      console.log('Audio blob created:', {
        size: audioBlob.size,
        type: audioBlob.type,
        chunks: this.audioChunks.length
      });

      // Convert to base64 for transmission
      const reader = new FileReader();
      reader.onloadend = () => {
        const base64Audio = reader.result.split(',')[1]; // Remove data:audio/webm;base64, prefix
        
        console.log('Audio converted to base64:', {
          originalSize: audioBlob.size,
          base64Size: base64Audio.length
        });

        // Send to Phoenix backend for Deepgram processing
        this.pushEvent("voice_audio", {
          audio: base64Audio,
          mime_type: audioBlob.type,
          size: audioBlob.size
        });
      };

      reader.onerror = (error) => {
        console.error('Failed to convert audio to base64:', error);
        this.pushEvent("voice_error", { error: "Failed to process recorded audio" });
      };

      reader.readAsDataURL(audioBlob);

    } catch (error) {
      console.error('Error processing recorded audio:', error);
      this.pushEvent("voice_error", { error: `Audio processing failed: ${error.message}` });
    } finally {
      // Clean up
      this.audioChunks = [];
      if (this.mediaStream) {
        this.mediaStream.getTracks().forEach(track => track.stop());
        this.mediaStream = null;
      }
      this.mediaRecorder = null;
    }
  },

  showInterimProgress() {
    // For MediaRecorder, show progressive recording indicators since we can't get real-time transcription
    if (!this.isRecording) return;
    
    const progressMessages = [
      "Recording audio...",
      "Capturing speech...",
      "Processing voice...",
      "Analyzing sound..."
    ];
    
    let messageIndex = 0;
    this.progressInterval = setInterval(() => {
      if (!this.isRecording) {
        clearInterval(this.progressInterval);
        return;
      }
      
      // Cycle through progress messages
      this.pushEvent("voice_interim", { 
        text: progressMessages[messageIndex % progressMessages.length] 
      });
      messageIndex++;
    }, 800); // Update every 800ms for visual feedback
  },

  clearInterimProgress() {
    if (this.progressInterval) {
      clearInterval(this.progressInterval);
      this.progressInterval = null;
    }
  },

  async startDeepgramStreaming() {
    try {
      console.log('Starting Deepgram streaming fallback...');
      
      // Get microphone access
      this.mediaStream = await navigator.mediaDevices.getUserMedia({
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true,
          sampleRate: 16000,
          channelCount: 1
        }
      });

      // Send streaming request to Phoenix backend
      this.pushEvent("start_deepgram_stream", {});
      
    } catch (error) {
      console.error('Failed to start Deepgram streaming:', error);
      this.isRecording = false;
      this.updateButtonState(false);
      this.pushEvent("voice_error", { error: `Microphone access denied: ${error.message}` });
    }
  },

  updateButtonState(isRecording) {
    // Update button classes and content for immediate visual feedback
    if (isRecording) {
      this.el.classList.remove('from-blue-500', 'to-purple-500', 'hover:from-blue-600', 'hover:to-purple-600');
      this.el.classList.add('from-green-500', 'to-green-600', 'animate-pulse');
      this.el.innerHTML = `
        <div class="flex items-center justify-center space-x-2">
          <div class="w-3 h-3 bg-white rounded-full animate-ping"></div>
          <span>🎤 Recording...</span>
        </div>
      `;
    } else {
      this.el.classList.remove('from-green-500', 'to-green-600', 'animate-pulse');
      this.el.classList.add('from-blue-500', 'to-purple-500', 'hover:from-blue-600', 'hover:to-purple-600');
      this.el.innerHTML = '🎤 Hold to Speak';
    }
  },

  updated() {
    // Preserve state when LiveView updates the DOM
    console.log('VoiceCapture updated, preserving state:', this.isRecording);
    if (this.isRecording) {
      this.updateButtonState(true);
    }
  },

  destroyed() {
    // Clean up Web Speech API
    if (this.recognition) {
      this.recognition.abort();
    }
    
    // Clean up MediaRecorder
    if (this.mediaRecorder && this.mediaRecorder.state === 'recording') {
      this.mediaRecorder.stop();
    }
    
    // Clean up progress indicators
    this.clearInterimProgress();
    
    // Clean up streams and sockets
    if (this.deepgramSocket) {
      this.deepgramSocket.close();
    }
    if (this.mediaStream) {
      this.mediaStream.getTracks().forEach(track => track.stop());
    }
    
    // Clear audio chunks
    this.audioChunks = [];
  }
};