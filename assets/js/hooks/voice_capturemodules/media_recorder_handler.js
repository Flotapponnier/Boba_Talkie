export const MediaRecorderHandler = {
  init(voiceCaptureInstance) {
    this.voiceCapture = voiceCaptureInstance;
    this.mediaStream = null;
    this.mediaRecorder = null;
    this.audioChunks = [];
    this.progressInterval = null;
    
    console.log('MediaRecorderHandler: Initialized');
  },
  
  async start() {
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
          console.log('MediaRecorderHandler: Audio chunk received:', event.data.size, 'bytes');
        }
      };

      this.mediaRecorder.onstop = () => {
        console.log('MediaRecorderHandler: Stopped, processing audio...');
        this.processRecordedAudio();
      };

      this.mediaRecorder.onerror = (error) => {
        console.error('MediaRecorderHandler: Error:', error);
        this.voiceCapture.pushEvent('voice_error', { error: `Recording failed: ${error.error}` });
      };

      // Start recording
      console.log('MediaRecorderHandler: Starting with MIME type:', options.mimeType || 'default');
      this.mediaRecorder.start();
      
      // Show interim progress
      this.showInterimProgress();
      
      return true;
    } catch (error) {
      console.error('MediaRecorderHandler: Failed to start:', error);
      return false;
    }
  },
  
  stop() {
    console.log('MediaRecorderHandler: Stopping...');
    
    // Clear interim progress
    this.clearInterimProgress();
    
    if (this.mediaRecorder && this.mediaRecorder.state === 'recording') {
      this.mediaRecorder.stop();
    }
  },
  
  showInterimProgress() {
    // Show progressive recording indicators since we can't get real-time transcription
    if (!this.voiceCapture.isRecording) return;
    
    const progressMessages = [
      'Recording audio...',
      'Capturing speech...',
      'Processing voice...',
      'Analyzing sound...'
    ];
    
    let messageIndex = 0;
    this.progressInterval = setInterval(() => {
      if (!this.voiceCapture.isRecording) {
        clearInterval(this.progressInterval);
        return;
      }
      
      // Cycle through progress messages
      this.voiceCapture.pushEvent('voice_interim', { 
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
  
  async processRecordedAudio() {
    if (this.audioChunks.length === 0) {
      console.log('MediaRecorderHandler: No audio chunks to process');
      return;
    }

    try {
      // Create audio blob from chunks
      const audioBlob = new Blob(this.audioChunks, { 
        type: this.mediaRecorder.mimeType || 'audio/webm' 
      });
      
      console.log('MediaRecorderHandler: Audio blob created:', {
        size: audioBlob.size,
        type: audioBlob.type,
        chunks: this.audioChunks.length
      });

      // Convert to base64 for transmission
      const reader = new FileReader();
      reader.onloadend = () => {
        const base64Audio = reader.result.split(',')[1]; // Remove data:audio/webm;base64, prefix
        
        console.log('MediaRecorderHandler: Audio converted to base64:', {
          originalSize: audioBlob.size,
          base64Size: base64Audio.length
        });

        // Send to Phoenix backend for Deepgram processing
        this.voiceCapture.pushEvent('voice_audio', {
          audio: base64Audio,
          mime_type: audioBlob.type,
          size: audioBlob.size
        });
      };

      reader.onerror = (error) => {
        console.error('MediaRecorderHandler: Failed to convert audio to base64:', error);
        this.voiceCapture.pushEvent('voice_error', { error: 'Failed to process recorded audio' });
      };

      reader.readAsDataURL(audioBlob);

    } catch (error) {
      console.error('MediaRecorderHandler: Error processing recorded audio:', error);
      this.voiceCapture.pushEvent('voice_error', { error: `Audio processing failed: ${error.message}` });
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
  
  destroy() {
    // Clean up MediaRecorder
    if (this.mediaRecorder && this.mediaRecorder.state === 'recording') {
      this.mediaRecorder.stop();
    }
    
    // Clean up progress indicators
    this.clearInterimProgress();
    
    // Clean up streams
    if (this.mediaStream) {
      this.mediaStream.getTracks().forEach(track => track.stop());
    }
    
    // Clear audio chunks
    this.audioChunks = [];
    
    console.log('MediaRecorderHandler: Cleaned up');
  }
};