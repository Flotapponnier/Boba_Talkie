export const KeyboardHandler = {
  init(voiceCaptureInstance) {
    this.voiceCapture = voiceCaptureInstance;
    this.keydownHandled = false;
    
    // Bind event handlers to preserve 'this' context
    this.handleKeyDown = this.handleKeyDown.bind(this);
    this.handleKeyUp = this.handleKeyUp.bind(this);
    
    // Add keyboard event listeners
    document.addEventListener('keydown', this.handleKeyDown);
    document.addEventListener('keyup', this.handleKeyUp);
    
    console.log('KeyboardHandler: R key support initialized');
  },
  
  handleKeyDown(e) {
    if (e.key.toLowerCase() === 'r' && !e.repeat && !this.keydownHandled) {
      e.preventDefault();
      console.log('KeyboardHandler: R key down - starting recording');
      this.keydownHandled = true;
      this.voiceCapture.startRecording();
    }
  },
  
  handleKeyUp(e) {
    if (e.key.toLowerCase() === 'r' && this.keydownHandled) {
      e.preventDefault();
      console.log('KeyboardHandler: R key up - stopping recording');
      this.keydownHandled = false;
      this.voiceCapture.stopRecording();
    }
  },
  
  destroy() {
    // Clean up keyboard event listeners
    document.removeEventListener('keydown', this.handleKeyDown);
    document.removeEventListener('keyup', this.handleKeyUp);
    this.keydownHandled = false;
    console.log('KeyboardHandler: Event listeners cleaned up');
  }
};