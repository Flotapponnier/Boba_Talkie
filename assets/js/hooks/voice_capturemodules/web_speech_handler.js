export const WebSpeechHandler = {
  init(voiceCaptureInstance) {
    this.voiceCapture = voiceCaptureInstance;
    this.recognition = null;
    this.recordingTimeout = null;
    
    console.log('WebSpeechHandler: Initialized');
  },
  
  isAvailable() {
    return 'webkitSpeechRecognition' in window || 'SpeechRecognition' in window;
  },
  
  setup(learningLanguage = 'en') {
    if (!this.isAvailable()) {
      console.warn('WebSpeechHandler: Web Speech API not available');
      return false;
    }
    
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    this.recognition = new SpeechRecognition();
    
    this.recognition.continuous = false;
    this.recognition.interimResults = true;
    
    // Map learning language to Web Speech API language codes
    const webSpeechLang = this.mapToWebSpeechLanguage(learningLanguage);
    console.log('WebSpeechHandler: Setting language:', webSpeechLang, 'from learning language:', learningLanguage);
    this.recognition.lang = webSpeechLang;
    
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
        this.voiceCapture.pushEvent('voice_interim', { text: interimTranscript });
      }
      
      // Send final result
      if (finalTranscript) {
        const confidence = event.results[0][0].confidence || 0.9;
        console.log('WebSpeechHandler: Result:', finalTranscript, 'confidence:', confidence);
        this.voiceCapture.pushEvent('voice_command', { 
          command: finalTranscript.trim(),
          confidence: confidence
        });
      }
    };
    
    this.recognition.onerror = (event) => {
      console.warn('WebSpeechHandler: Error, trying fallback:', event.error);
      // Try fallback if still recording
      if (this.voiceCapture.isRecording) {
        this.voiceCapture.startDeepgramStreaming();
      }
    };
    
    this.recognition.onend = () => {
      console.log('WebSpeechHandler: Recognition ended');
      // Only stop if we're not trying fallback
      if (this.voiceCapture.isRecording && !this.voiceCapture.deepgramSocket) {
        this.voiceCapture.isRecording = false;
        this.voiceCapture.buttonStateManager.updateRecordingState(false);
        this.voiceCapture.pushEvent('stop_listening', {});
      }
    };
    
    return true;
  },
  
  mapToWebSpeechLanguage(learningLanguage) {
    // Map our language codes to Web Speech API language codes
    const mapping = {
      'en': 'en-US',
      'fr': 'fr-FR', 
      'es': 'es-ES',
      'zh': 'zh-CN',
      'ru': 'ru-RU',
      'ja': 'ja-JP',
      'it': 'it-IT',
      'ar': 'ar-SA',
      'pt': 'pt-PT'
    };
    
    return mapping[learningLanguage] || 'en-US';
  },
  
  start() {
    if (!this.recognition) {
      console.error('WebSpeechHandler: Recognition not initialized');
      return false;
    }
    
    try {
      this.recognition.start();
      console.log('WebSpeechHandler: Started successfully');
      return true;
    } catch (error) {
      console.error('WebSpeechHandler: Failed to start:', error);
      return false;
    }
  },
  
  stop() {
    if (this.recognition) {
      try {
        this.recognition.stop();
        console.log('WebSpeechHandler: Stopped');
      } catch (error) {
        console.log('WebSpeechHandler: Error stopping:', error);
      }
    }
  },
  
  destroy() {
    if (this.recognition) {
      this.recognition.abort();
    }
    if (this.recordingTimeout) {
      clearTimeout(this.recordingTimeout);
    }
    console.log('WebSpeechHandler: Cleaned up');
  }
};