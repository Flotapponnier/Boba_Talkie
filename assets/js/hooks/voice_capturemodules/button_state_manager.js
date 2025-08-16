export const ButtonStateManager = {
  init(buttonElement) {
    this.el = buttonElement;
    console.log('ButtonStateManager: Initialized');
  },
  
  updateRecordingState(isRecording) {
    // Update button classes and content for immediate visual feedback
    if (isRecording) {
      this.el.classList.remove(
        'from-blue-500',
        'to-purple-500', 
        'hover:from-blue-600',
        'hover:to-purple-600'
      );
      this.el.classList.add('from-green-500', 'to-green-600', 'animate-pulse');
      this.el.innerHTML = `
        <div class="flex items-center justify-center space-x-2">
          <div class="w-3 h-3 bg-white rounded-full animate-ping"></div>
          <span>Recording...</span>
        </div>
      `;
    } else {
      this.el.classList.remove('from-green-500', 'to-green-600', 'animate-pulse');
      this.el.classList.add(
        'from-blue-500',
        'to-purple-500',
        'hover:from-blue-600', 
        'hover:to-purple-600'
      );
      this.el.innerHTML = 'Hold to Speak (or hold "R")';
    }
  },
  
  preserveStateOnUpdate(isRecording) {
    // Preserve state when LiveView updates the DOM
    console.log('ButtonStateManager: Preserving state:', isRecording);
    if (isRecording) {
      this.updateRecordingState(true);
    }
  }
};