export default {
  mounted() {
    this.initClouds();
  },

  initClouds() {
    // Create clouds container
    const cloudsContainer = document.createElement('div');
    cloudsContainer.className = 'clouds-container';
    document.body.appendChild(cloudsContainer);

    // Cloud images array (we have 9 cloud images)
    const cloudImages = Array.from({length: 9}, (_, i) => `/images/clouds/cloud${i + 1}.png`);
    
    // Function to create a random cloud
    const createCloud = () => {
      const cloud = document.createElement('img');
      const cloudIndex = Math.floor(Math.random() * cloudImages.length);
      const cloudClass = `cloud-${cloudIndex + 1}`;
      
      cloud.src = cloudImages[cloudIndex];
      cloud.className = `cloud ${cloudClass}`;
      cloud.style.left = '-200px';
      
      // More random vertical positioning across full height
      const randomTop = Math.random() * 90; // Random position from 0% to 90%
      cloud.style.top = `${randomTop}%`;
      
      // Add random delay to stagger clouds
      cloud.style.animationDelay = `${Math.random() * 5}s`;
      
      // Random size variation (80% to 120% of base size)
      const sizeMultiplier = 0.8 + Math.random() * 0.4;
      cloud.style.transform = `scale(${sizeMultiplier})`;
      
      // Random animation duration (20s to 50s)
      const duration = 20 + Math.random() * 30;
      cloud.style.animationDuration = `${duration}s`;
      
      cloudsContainer.appendChild(cloud);
      
      // Remove cloud after animation completes
      const animationDuration = parseFloat(getComputedStyle(cloud).animationDuration);
      setTimeout(() => {
        if (cloud.parentNode) {
          cloud.parentNode.removeChild(cloud);
        }
      }, (animationDuration + 5) * 1000);
    };

    // Create initial clouds with more variety
    for (let i = 0; i < 6; i++) {
      setTimeout(createCloud, i * 1500);
    }

    // Continue creating clouds at more frequent random intervals
    this.cloudInterval = setInterval(() => {
      createCloud();
    }, Math.random() * 4000 + 2000); // Every 2-6 seconds
  },

  destroyed() {
    if (this.cloudInterval) {
      clearInterval(this.cloudInterval);
    }
    
    // Remove clouds container
    const cloudsContainer = document.querySelector('.clouds-container');
    if (cloudsContainer) {
      cloudsContainer.remove();
    }
  }
};