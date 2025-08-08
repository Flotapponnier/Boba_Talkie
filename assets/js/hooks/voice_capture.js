export const VoiceCapture = {
  mounted() {
    this.isRecording = false;
    this.recognition = null;
    this.deepgramSocket = null;
    this.mediaStream = null;
    
    console.log('VoiceCapture mounted - Web Speech API with Deepgram fallback');
    
    // Initialize Web Speech API (preferred)
    this.initWebSpeechAPI();
    
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
    
    if (!this.recognition) {
      console.error('Web Speech API not available');
      this.pushEvent("voice_error", { error: "Speech recognition not available in this browser" });
      return;
    }
    
    console.log('Starting Web Speech API recording...');
    this.isRecording = true;
    
    // Update button appearance immediately for visual feedback
    this.updateButtonState(true);
    
    this.pushEvent("start_listening", {});
    
    try {
      console.log('Starting Web Speech API recognition');
      this.recognition.start();
    } catch (error) {
      console.error('Web Speech API failed to start:', error);
      this.isRecording = false;
      this.updateButtonState(false);
      this.pushEvent("voice_error", { error: `Failed to start speech recognition: ${error.message}` });
    }
  },

  stopRecording() {
    if (!this.isRecording) {
      console.log('Not recording, ignoring stop');
      return;
    }
    
    console.log('Stopping Web Speech API recording...');
    this.isRecording = false;
    
    // Update button appearance immediately
    this.updateButtonState(false);
    
    if (this.recognition) {
      try {
        this.recognition.stop();
        console.log('Web Speech API stopped');
      } catch (error) {
        console.log('Error stopping recognition:', error);
      }
    }
    
    // Stop Deepgram streaming if active
    if (this.deepgramSocket) {
      this.deepgramSocket.close();
      this.deepgramSocket = null;
      console.log('Deepgram streaming stopped');
    }
    
    // Stop media stream if active
    if (this.mediaStream) {
      this.mediaStream.getTracks().forEach(track => track.stop());
      this.mediaStream = null;
      console.log('Media stream stopped');
    }
    
    // Always notify the server that we stopped listening
    this.pushEvent("stop_listening", {});
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
    if (this.recognition) {
      this.recognition.abort();
    }
    if (this.deepgramSocket) {
      this.deepgramSocket.close();
    }
    if (this.mediaStream) {
      this.mediaStream.getTracks().forEach(track => track.stop());
    }
  }
};