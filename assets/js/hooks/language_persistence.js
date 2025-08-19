export const LanguagePersistence = {
  mounted() {
    console.log("LanguagePersistence hook mounted");
    
    // On page load, check if we need to redirect based on stored language
    this.checkAndRedirectFromStorage();
    
    this.handleEvent("store_and_reload", ({interface_language, learning_language}) => {
      console.log("Storing languages and reloading:", interface_language, learning_language);
      localStorage.setItem("boba_interface_language", interface_language);
      localStorage.setItem("boba_learning_language", learning_language);
      
      // Build URL with language params
      const currentPath = window.location.pathname;
      const newUrl = `${currentPath}?interface_language=${interface_language}&learning_language=${learning_language}`;
      window.location.href = newUrl;
    });
  },
  
  checkAndRedirectFromStorage() {
    // Only redirect if no URL params exist
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('interface_language')) {
      return; // URL params take precedence
    }
    
    const storedInterface = localStorage.getItem("boba_interface_language");
    const storedLearning = localStorage.getItem("boba_learning_language");
    
    if (storedInterface && storedInterface !== 'en') {
      console.log("Redirecting to stored language:", storedInterface);
      const currentPath = window.location.pathname;
      const newUrl = `${currentPath}?interface_language=${storedInterface}&learning_language=${storedLearning || 'en'}`;
      window.location.href = newUrl;
    }
  }
};