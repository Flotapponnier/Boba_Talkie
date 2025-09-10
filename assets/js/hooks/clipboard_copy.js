/**
 * ClipboardCopy Hook
 * 
 * Handles copying text to clipboard from multiplayer lobby
 * for sharing room links
 */
export const ClipboardCopy = {
  mounted() {
    // Listen for copy_to_clipboard events
    this.handleEvent("copy_to_clipboard", ({ text }) => {
      this.copyToClipboard(text);
    });
  },

  copyToClipboard(text) {
    if (navigator.clipboard && window.isSecureContext) {
      // Modern approach using Clipboard API
      navigator.clipboard.writeText(text).then(() => {
        this.showCopySuccess();
      }).catch(err => {
        console.error('Failed to copy to clipboard:', err);
        this.fallbackCopy(text);
      });
    } else {
      // Fallback for older browsers or non-secure contexts
      this.fallbackCopy(text);
    }
  },

  fallbackCopy(text) {
    try {
      const textArea = document.createElement('textarea');
      textArea.value = text;
      textArea.style.position = 'fixed';
      textArea.style.left = '-999999px';
      textArea.style.top = '-999999px';
      document.body.appendChild(textArea);
      
      textArea.focus();
      textArea.select();
      
      const successful = document.execCommand('copy');
      document.body.removeChild(textArea);
      
      if (successful) {
        this.showCopySuccess();
      } else {
        this.showCopyError();
      }
    } catch (err) {
      console.error('Fallback copy failed:', err);
      this.showCopyError();
    }
  },

  showCopySuccess() {
    // Create temporary success message
    const message = document.createElement('div');
    message.className = 'fixed top-4 right-4 bg-green-500 text-white px-4 py-2 rounded-lg shadow-lg z-50';
    message.textContent = 'Room link copied to clipboard!';
    document.body.appendChild(message);
    
    setTimeout(() => {
      if (message.parentNode) {
        message.parentNode.removeChild(message);
      }
    }, 3000);
  },

  showCopyError() {
    const message = document.createElement('div');
    message.className = 'fixed top-4 right-4 bg-red-500 text-white px-4 py-2 rounded-lg shadow-lg z-50';
    message.textContent = 'Failed to copy to clipboard';
    document.body.appendChild(message);
    
    setTimeout(() => {
      if (message.parentNode) {
        message.parentNode.removeChild(message);
      }
    }, 3000);
  }
};