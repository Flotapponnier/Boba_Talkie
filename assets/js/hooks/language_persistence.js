export const LanguagePersistence = {
  mounted() {
    console.log("LanguagePersistence hook mounted");
    
    // On page load, check if we need to redirect based on stored language
    this.checkAndRedirectFromStorage();
    
    this.handleEvent("store_and_reload", ({interface_language, learning_language}) => {
      console.log("Storing languages and reloading:", interface_language, learning_language);
      
      // NEVER reload during game/tutorial - this resets the game state
      const currentPath = window.location.pathname;
      if (currentPath.includes('/game/') || currentPath.includes('/tutorial/')) {
        console.log("LanguagePersistence: Ignoring store_and_reload during game/tutorial");
        // Just store the languages without reloading
        localStorage.setItem("boba_interface_language", interface_language);
        localStorage.setItem("boba_learning_language", learning_language);
        return;
      }
      
      localStorage.setItem("boba_interface_language", interface_language);
      localStorage.setItem("boba_learning_language", learning_language);
      
      // Build URL with language params
      const newUrl = `${currentPath}?interface_language=${interface_language}&learning_language=${learning_language}`;
      window.location.href = newUrl;
    });
    
    // New event for storing languages without reload (for real-time language switching)
    this.handleEvent("store_language", ({interface_language, learning_language}) => {
      console.log("Storing languages without reload:", interface_language, learning_language);
      localStorage.setItem("boba_interface_language", interface_language);
      localStorage.setItem("boba_learning_language", learning_language);
      
      // Update URL params without reload
      const currentPath = window.location.pathname;
      const newUrl = `${currentPath}?interface_language=${interface_language}&learning_language=${learning_language}`;
      window.history.replaceState({}, '', newUrl);
    });
  },
  
  checkAndRedirectFromStorage() {
    const currentPath = window.location.pathname;
    const urlParams = new URLSearchParams(window.location.search);
    
    // During game/tutorial: if no URL params, restore from localStorage and update URL without redirect
    if (currentPath.includes('/game/') || currentPath.includes('/tutorial/')) {
      if (!urlParams.has('interface_language')) {
        const storedInterface = localStorage.getItem("boba_interface_language");
        const storedLearning = localStorage.getItem("boba_learning_language");
        
        if (storedInterface) {
          console.log("Restoring languages from storage during game:", storedInterface, storedLearning);
          const newUrl = `${currentPath}?interface_language=${storedInterface}&learning_language=${storedLearning || 'en'}`;
          window.history.replaceState({}, '', newUrl);
          
          // Send event to LiveView to update its state
          this.pushEvent("restore_languages", {
            interface_language: storedInterface,
            learning_language: storedLearning || 'en'
          });
        }
      }
      return;
    }
    
    // For non-game pages: redirect if no URL params and we have stored languages
    if (!urlParams.has('interface_language')) {
      const storedInterface = localStorage.getItem("boba_interface_language");
      const storedLearning = localStorage.getItem("boba_learning_language");
      
      if (storedInterface && storedInterface !== 'en') {
        console.log("Redirecting to stored language:", storedInterface);
        const newUrl = `${currentPath}?interface_language=${storedInterface}&learning_language=${storedLearning || 'en'}`;
        window.location.href = newUrl;
      }
    }
  }
};