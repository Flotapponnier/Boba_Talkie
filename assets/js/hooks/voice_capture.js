// Import modular components
import { KeyboardHandler } from './voice_capturemodules/keyboard_handler.js';
import { ButtonStateManager } from './voice_capturemodules/button_state_manager.js';
import { WebSpeechHandler } from './voice_capturemodules/web_speech_handler.js';
import { MediaRecorderHandler } from './voice_capturemodules/media_recorder_handler.js';

export const VoiceCapture = {
  mounted() {
    this.isRecording = false;
    this.deepgramSocket = null;
    
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
    
    // Initialize modular components
    this.keyboardHandler = Object.create(KeyboardHandler);
    this.buttonStateManager = Object.create(ButtonStateManager);
    this.webSpeechHandler = Object.create(WebSpeechHandler);
    this.mediaRecorderHandler = Object.create(MediaRecorderHandler);
    
    // Initialize components
    this.keyboardHandler.init(this);
    this.buttonStateManager.init(this.el);
    this.webSpeechHandler.init(this);
    this.mediaRecorderHandler.init(this);
    
    // Initialize appropriate speech recognition method
    if (!this.isBrave && this.hasWebSpeech) {
      this.webSpeechHandler.setup();
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

  async startRecording() {
    if (this.isRecording) {
      console.log('Already recording, ignoring');
      return;
    }
    
    this.isRecording = true;
    this.buttonStateManager.updateRecordingState(true);
    this.pushEvent('start_listening', {});
    
    if (this.isBrave || !this.hasWebSpeech) {
      // Use MediaRecorder for Brave or browsers without Web Speech API
      console.log('Starting MediaRecorder fallback...');
      const success = await this.mediaRecorderHandler.start();
      if (!success) {
        this.isRecording = false;
        this.buttonStateManager.updateRecordingState(false);
        this.pushEvent('voice_error', { error: 'Microphone access failed' });
      }
    } else {
      // Use Web Speech API for Chrome/others (fast, real-time)
      console.log('Starting Web Speech API recording...');
      const success = this.webSpeechHandler.start();
      if (!success) {
        this.isRecording = false;
        this.buttonStateManager.updateRecordingState(false);
        this.pushEvent('voice_error', { error: 'Failed to start speech recognition' });
      }
    }
  },

  stopRecording() {
    if (!this.isRecording) {
      console.log('Not recording, ignoring stop');
      return;
    }
    
    console.log('Stopping recording...');
    this.isRecording = false;
    this.buttonStateManager.updateRecordingState(false);
    
    if (this.isBrave || !this.hasWebSpeech) {
      // Stop MediaRecorder for Brave/fallback
      this.mediaRecorderHandler.stop();
    } else {
      // Stop Web Speech API for Chrome/others
      this.webSpeechHandler.stop();
    }
    
    // Always notify the server that we stopped listening
    this.pushEvent('stop_listening', {});
  },

  async startDeepgramStreaming() {
    try {
      console.log('Starting Deepgram streaming fallback...');
      
      // Get microphone access
      const stream = await navigator.mediaDevices.getUserMedia({
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true,
          sampleRate: 16000,
          channelCount: 1
        }
      });

      // Send streaming request to Phoenix backend
      this.pushEvent('start_deepgram_stream', {});
      
    } catch (error) {
      console.error('Failed to start Deepgram streaming:', error);
      this.isRecording = false;
      this.buttonStateManager.updateRecordingState(false);
      this.pushEvent('voice_error', { error: `Microphone access denied: ${error.message}` });
    }
  },

  updated() {
    // Preserve state when LiveView updates the DOM
    console.log('VoiceCapture updated, preserving state:', this.isRecording);
    this.buttonStateManager.preserveStateOnUpdate(this.isRecording);
  },

  destroyed() {
    // Clean up all modular components
    this.keyboardHandler.destroy();
    this.webSpeechHandler.destroy();
    this.mediaRecorderHandler.destroy();
    
    // Clean up Deepgram socket
    if (this.deepgramSocket) {
      this.deepgramSocket.close();
    }
    
    console.log('VoiceCapture: All components cleaned up');
  }
};