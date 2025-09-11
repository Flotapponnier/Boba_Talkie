/**
 * WebRTCVideo Hook
 * 
 * Handles peer-to-peer video conferencing for multiplayer games
 * using WebRTC for direct player-to-player communication
 */
export const WebRTCVideo = {
  mounted() {
    this.roomId = this.el.dataset.roomId;
    this.playerId = this.el.dataset.playerId;
    this.localStream = null;
    this.remoteStream = null;
    this.peerConnection = null;
    this.isInitiator = false;

    // WebRTC configuration with STUN servers
    this.rtcConfiguration = {
      iceServers: [
        { urls: 'stun:stun.l.google.com:19302' },
        { urls: 'stun:stun1.l.google.com:19302' }
      ]
    };

    this.initializeWebRTC();
    this.setupEventListeners();
  },

  destroyed() {
    this.cleanup();
  },

  async initializeWebRTC() {
    try {
      console.log('🎥 Initializing WebRTC for player:', this.playerId, 'in room:', this.roomId);
      
      // Get local media stream with specific constraints
      this.localStream = await navigator.mediaDevices.getUserMedia({
        video: {
          width: { ideal: 640 },
          height: { ideal: 480 },
          frameRate: { ideal: 30 }
        },
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true
        }
      });

      console.log('🎥 Local media stream acquired:', this.localStream.getTracks().map(t => t.kind));

      // Display local video (using unique ID based on player)
      const localVideoId = `local-video-${this.playerId}`;
      const localVideo = document.getElementById(localVideoId);
      console.log('🎥 Looking for local video element with ID:', localVideoId);
      
      if (localVideo) {
        localVideo.srcObject = this.localStream;
        localVideo.volume = 0; // Ensure local video is muted to prevent feedback
        localVideo.muted = true; // Additional muting for safety
        
        // Ensure local video starts playing
        localVideo.oncanplay = () => {
          console.log('🎥 Local video can play, attempting to play...');
          localVideo.play().catch(e => console.warn('⚠️ Local video autoplay prevented:', e));
        };
        
        localVideo.onloadedmetadata = () => {
          console.log('🎥 Local video metadata loaded, video dimensions:', localVideo.videoWidth, 'x', localVideo.videoHeight);
        };
        
        console.log('🎥 Local video element connected with ID:', localVideoId);
      } else {
        console.error('❌ Local video element not found with ID:', localVideoId);
      }

      // Create peer connection
      this.peerConnection = new RTCPeerConnection(this.rtcConfiguration);
      console.log('🔗 Peer connection created');
      
      // Add local stream to peer connection
      this.localStream.getTracks().forEach(track => {
        console.log('📡 Adding track to peer connection:', track.kind);
        this.peerConnection.addTrack(track, this.localStream);
      });

      // Handle remote stream
      this.peerConnection.ontrack = (event) => {
        console.log('📨 Received remote stream event:', event);
        console.log('📨 Event streams length:', event.streams.length);
        console.log('📨 Event track kind:', event.track.kind);
        
        const [remoteStream] = event.streams;
        if (remoteStream) {
          this.remoteStream = remoteStream;
          console.log('📨 Remote stream tracks:', remoteStream.getTracks().map(t => `${t.kind}:${t.enabled ? 'enabled' : 'disabled'}`));
          
          // Use unique IDs for partner video elements
          const partnerVideoId = `partner-video-${this.playerId}`;
          const placeholderId = `partner-video-placeholder-${this.playerId}`;
          const partnerVideo = document.getElementById(partnerVideoId);
          const placeholder = document.getElementById(placeholderId);
          
          console.log('🎥 Looking for partner video element with ID:', partnerVideoId);
          
          if (partnerVideo) {
            console.log('🎥 Setting partner video srcObject...');
            partnerVideo.srcObject = remoteStream;
            partnerVideo.style.display = 'block';
            
            // Wait for video to be ready before hiding placeholder
            partnerVideo.onloadedmetadata = () => {
              console.log('🎥 Partner video metadata loaded, video dimensions:', partnerVideo.videoWidth, 'x', partnerVideo.videoHeight);
              if (placeholder) {
                placeholder.style.display = 'none';
              }
            };
            
            // Additional event to ensure video starts playing
            partnerVideo.oncanplay = () => {
              console.log('🎥 Partner video can play, attempting to play...');
              partnerVideo.play().catch(e => console.warn('⚠️ Autoplay prevented:', e));
            };
            
            console.log('🎥 Partner video stream connected successfully with ID:', partnerVideoId);
          } else {
            console.error('❌ Partner video element not found with ID:', partnerVideoId);
          }
        } else {
          console.error('❌ No remote stream in event');
        }
      };

      // Handle ICE candidates
      this.peerConnection.onicecandidate = (event) => {
        if (event.candidate) {
          this.pushEvent("webrtc_ice_candidate", {
            room_id: this.roomId,
            candidate: {
              candidate: event.candidate.candidate,
              sdpMid: event.candidate.sdpMid,
              sdpMLineIndex: event.candidate.sdpMLineIndex
            }
          });
        }
      };

      // Handle connection state changes
      this.peerConnection.onconnectionstatechange = () => {
        console.log('🔗 WebRTC connection state changed to:', this.peerConnection.connectionState);
        
        switch (this.peerConnection.connectionState) {
          case 'connected':
            console.log('✅ WebRTC connection established successfully');
            this.pushEvent("webrtc_connected", { room_id: this.roomId });
            break;
          case 'disconnected':
            console.log('⚠️ WebRTC connection disconnected');
            this.pushEvent("webrtc_disconnected", { room_id: this.roomId });
            break;
          case 'failed':
            console.log('❌ WebRTC connection failed');
            this.pushEvent("webrtc_error", { room_id: this.roomId, error: "Connection failed" });
            break;
          case 'closed':
            console.log('🔴 WebRTC connection closed');
            break;
        }
      };

      // Handle ICE connection state changes
      this.peerConnection.oniceconnectionstatechange = () => {
        console.log('🧊 ICE connection state:', this.peerConnection.iceConnectionState);
      };

      // Handle gathering state changes
      this.peerConnection.onicegatheringstatechange = () => {
        console.log('🧊 ICE gathering state:', this.peerConnection.iceGatheringState);
      };

      // Join the WebRTC signaling room
      this.pushEvent("join_webrtc_room", { 
        room_id: this.roomId,
        player_id: this.playerId 
      });

    } catch (error) {
      console.error('Error initializing WebRTC:', error);
      this.pushEvent("webrtc_error", { 
        room_id: this.roomId, 
        error: error.message 
      });
    }
  },

  setupEventListeners() {
    // Listen for WebRTC signaling events from server
    this.handleEvent("webrtc_offer", async ({ offer, from_player }) => {
      if (from_player !== this.playerId) {
        await this.handleOffer(offer);
      }
    });

    this.handleEvent("webrtc_answer", async ({ answer, from_player }) => {
      if (from_player !== this.playerId) {
        await this.handleAnswer(answer);
      }
    });

    this.handleEvent("webrtc_ice_candidate", async ({ candidate, from_player }) => {
      if (from_player !== this.playerId) {
        await this.handleIceCandidate(candidate);
      }
    });

    this.handleEvent("webrtc_peer_joined", ({ player_id }) => {
      console.log('🤝 WebRTC peer joined:', player_id, 'My ID:', this.playerId);
      if (player_id !== this.playerId) {
        console.log('🚀 I am the initiator, creating offer...');
        console.log('🚀 Peer connection state:', this.peerConnection?.connectionState);
        console.log('🚀 Local stream tracks:', this.localStream?.getTracks().map(t => t.kind));
        this.isInitiator = true;
        // Add small delay to ensure peer connection is fully initialized
        setTimeout(() => {
          if (this.peerConnection && this.localStream) {
            this.createOffer();
          } else {
            console.error('❌ Cannot create offer: peer connection or local stream not ready');
          }
        }, 100);
      }
    });

    // Handle media toggle events from LiveView
    this.handleEvent("toggle_local_video", ({ enabled }) => {
      this.toggleLocalVideo(enabled);
    });

    this.handleEvent("toggle_local_audio", ({ enabled }) => {
      this.toggleLocalAudio(enabled);
    });
  },

  async createOffer() {
    try {
      console.log('📤 Creating WebRTC offer...');
      console.log('📤 Peer connection state:', this.peerConnection.connectionState);
      console.log('📤 Signaling state:', this.peerConnection.signalingState);
      
      const offer = await this.peerConnection.createOffer({
        offerToReceiveAudio: true,
        offerToReceiveVideo: true
      });
      
      console.log('📤 Offer created, setting local description');
      await this.peerConnection.setLocalDescription(offer);
      
      console.log('📤 Sending offer to server via Phoenix');
      this.pushEvent("webrtc_offer", {
        room_id: this.roomId,
        offer: {
          type: offer.type,
          sdp: offer.sdp
        }
      });
      
      console.log('✅ Offer sent successfully');
    } catch (error) {
      console.error('❌ Error creating offer:', error);
    }
  },

  async handleOffer(offer) {
    try {
      console.log('📥 Received WebRTC offer, creating answer...');
      console.log('📥 Peer connection state:', this.peerConnection.connectionState);
      console.log('📥 Signaling state:', this.peerConnection.signalingState);
      
      await this.peerConnection.setRemoteDescription(new RTCSessionDescription(offer));
      console.log('📥 Remote description set');
      
      const answer = await this.peerConnection.createAnswer();
      console.log('📥 Answer created, setting local description');
      await this.peerConnection.setLocalDescription(answer);
      
      console.log('📥 Sending answer to server via Phoenix');
      this.pushEvent("webrtc_answer", {
        room_id: this.roomId,
        answer: {
          type: answer.type,
          sdp: answer.sdp
        }
      });
      
      console.log('✅ Answer sent successfully');
    } catch (error) {
      console.error('❌ Error handling offer:', error);
    }
  },

  async handleAnswer(answer) {
    try {
      console.log('📥 Received WebRTC answer');
      console.log('📥 Peer connection state:', this.peerConnection.connectionState);
      console.log('📥 Signaling state:', this.peerConnection.signalingState);
      
      await this.peerConnection.setRemoteDescription(new RTCSessionDescription(answer));
      console.log('✅ Remote description set - WebRTC negotiation complete');
      console.log('🔗 Final connection state:', this.peerConnection.connectionState);
    } catch (error) {
      console.error('❌ Error handling answer:', error);
    }
  },

  async handleIceCandidate(candidate) {
    try {
      console.log('🧊 Adding ICE candidate:', candidate);
      await this.peerConnection.addIceCandidate(new RTCIceCandidate(candidate));
      console.log('✅ ICE candidate added successfully');
    } catch (error) {
      console.error('❌ Error handling ICE candidate:', error);
    }
  },

  toggleLocalVideo(enabled) {
    console.log('🎥 Toggle local video called with enabled:', enabled);
    if (this.localStream) {
      const videoTracks = this.localStream.getVideoTracks();
      console.log('🎥 Found video tracks:', videoTracks.length);
      videoTracks.forEach((track, index) => {
        console.log(`🎥 Setting video track ${index} enabled to:`, enabled);
        track.enabled = enabled;
      });
    } else {
      console.error('❌ No local stream available for video toggle');
    }
  },

  toggleLocalAudio(enabled) {
    console.log('🎤 Toggle local audio called with enabled:', enabled);
    if (this.localStream) {
      const audioTracks = this.localStream.getAudioTracks();
      console.log('🎤 Found audio tracks:', audioTracks.length);
      audioTracks.forEach((track, index) => {
        console.log(`🎤 Setting audio track ${index} enabled to:`, enabled);
        track.enabled = enabled;
      });
    } else {
      console.error('❌ No local stream available for audio toggle');
    }
  },

  cleanup() {
    console.log('🧹 Cleaning up WebRTC resources...');
    
    // Close peer connection
    if (this.peerConnection) {
      this.peerConnection.close();
      this.peerConnection = null;
      console.log('🔗 Peer connection closed');
    }

    // Stop local stream
    if (this.localStream) {
      this.localStream.getTracks().forEach(track => {
        track.stop();
        console.log('🎥 Stopped track:', track.kind);
      });
      this.localStream = null;
    }

    // Clear video elements using unique IDs
    const localVideoId = `local-video-${this.playerId}`;
    const partnerVideoId = `partner-video-${this.playerId}`;
    const placeholderId = `partner-video-placeholder-${this.playerId}`;
    
    const localVideo = document.getElementById(localVideoId);
    const partnerVideo = document.getElementById(partnerVideoId);
    const placeholder = document.getElementById(placeholderId);
    
    if (localVideo) {
      localVideo.srcObject = null;
      console.log('🎥 Local video cleared:', localVideoId);
    }
    if (partnerVideo) {
      partnerVideo.srcObject = null;
      partnerVideo.style.display = 'none';
      console.log('🎥 Partner video cleared:', partnerVideoId);
    }
    if (placeholder) {
      placeholder.style.display = 'block';
      console.log('👤 Partner placeholder restored:', placeholderId);
    }

    // Leave WebRTC room
    this.pushEvent("leave_webrtc_room", { 
      room_id: this.roomId,
      player_id: this.playerId 
    });
    
    console.log('✅ WebRTC cleanup complete');
  }
};