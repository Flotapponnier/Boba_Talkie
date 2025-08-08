export const MicrophoneTest = {
  mounted() {
    this.handleEvent("check_microphone", () => {
      this.testMicrophone();
    });
  },

  async testMicrophone() {
    try {
      // Check if MediaRecorder is available
      if (!window.MediaRecorder) {
        throw new Error("MediaRecorder not supported in this browser");
      }

      // Show permission request message for Brave/privacy-focused browsers
      this.el.innerHTML = `
        <div class="flex items-center justify-center space-x-2">
          <div class="w-3 h-3 bg-blue-400 rounded-full animate-pulse"></div>
          <span class="text-blue-400">Requesting microphone permission...</span>
        </div>
        <div class="text-xs text-gray-400 mt-2 text-center">
          Click "Allow" in your browser's permission prompt
        </div>
      `;

      // Request microphone permission with more explicit settings
      const stream = await navigator.mediaDevices.getUserMedia({ 
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true,
          sampleRate: 16000 // Optimal for speech recognition
        },
        video: false
      });

      // Test recording capability
      const mediaRecorder = new MediaRecorder(stream, {
        mimeType: 'audio/webm;codecs=opus'
      });

      // Visual feedback during test
      this.el.innerHTML = `
        <div class="flex items-center justify-center space-x-2">
          <div class="w-3 h-3 bg-yellow-400 rounded-full animate-pulse"></div>
          <span class="text-yellow-400">Testing microphone...</span>
        </div>
        <div class="text-xs text-green-400 mt-2 text-center">
          Permission granted! Testing audio...
        </div>
      `;

      // Quick recording test
      mediaRecorder.start();
      
      setTimeout(() => {
        mediaRecorder.stop();
        stream.getTracks().forEach(track => track.stop());
        
        // Success - notify LiveView
        this.pushEvent("check_microphone", {});
      }, 1000);

      mediaRecorder.onerror = (error) => {
        throw new Error(`MediaRecorder error: ${error.error}`);
      };

    } catch (error) {
      console.error("Microphone test failed:", error);
      
      // Show error and notify LiveView
      this.el.innerHTML = `
        <div class="flex items-center justify-center space-x-2">
          <div class="w-3 h-3 bg-red-400 rounded-full"></div>
          <span class="text-red-400">Microphone access denied</span>
        </div>
      `;
      
      this.pushEvent("microphone_error", { error: error.message });
    }
  }
};