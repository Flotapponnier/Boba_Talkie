# BobaTalkie - Voice-Controlled Language Learning Game

## Introduction
Boba Talkie is an innovative way to learn a language, meeting people online in a gamified way. Mostly focusing on voice recognition and voice improvement to execute actions in the game. Boba Talkie's vision is to bring players to learn a language in a fun and interactive way, focusing on Vocabulary, Pronunciation and conversation. Boba Talkie has a multiplayer mode with live video chat and microphone (video can be deactivated) to encourage people to meet and find language exchange partners through playing and interaction.

## Project Overview

BobaTalkie is a web-based language learning game where players control their character through voice commands instead of traditional input methods. The core innovation is using speech recognition to create an immersive, interactive environment that teaches pronunciation and vocabulary naturally through gameplay.

## Architecture

### Tech Stack
- **Backend**: Elixir/Phoenix with LiveView for real-time UI updates
- **Real-time Communication**: Phoenix Channels over WebSockets for <500ms voice processing latency
- **Speech Recognition**: Deepgram API for streaming ASR (Automatic Speech Recognition)
- **Frontend**: Phoenix LiveView with PWA capabilities for mobile-first design
- **Deployment**: Fly.io for global edge deployment

### System Components

#### Backend Architecture (lib/)
```
lib/boba_talkie/
├── game/               # Game logic and state management
│   ├── player.ex      # Player state and actions
│   ├── world.ex       # Game world and mechanics
│   └── commands.ex    # Voice command processing
├── voice/             # Voice processing pipeline
│   ├── recognizer.ex  # Deepgram ASR integration
│   ├── processor.ex   # Command parsing and validation
│   └── feedback.ex    # Pronunciation feedback system
└── application.ex     # Application supervision tree
```

#### Frontend Architecture (assets/)
```
assets/
├── js/
│   ├── voice/         # Voice capture and streaming
│   ├── game/          # Game UI interactions
│   └── app.js         # Main application entry
├── css/               # Tailwind CSS styling
├── images/            # Game sprites and UI assets
└── audio/             # Sound effects and audio feedback
```

#### Static Assets (priv/static/)
```
priv/static/
├── images/            # Compiled image assets
├── audio/             # Audio files for game feedback
└── [generated]/       # Built CSS/JS files
```

## Core Workflow

1. **Voice Capture**: Browser captures audio via WebRTC MediaRecorder
2. **Streaming**: Audio chunks stream to Phoenix via WebSocket channels
3. **Recognition**: Deepgram processes audio and returns transcription
4. **Command Processing**: Backend parses voice commands and validates pronunciation
5. **Game State Update**: LiveView updates game state in real-time
6. **Feedback**: Visual and audio feedback sent back to player

## Real-time Architecture

### Phoenix Channels
- `VoiceChannel`: Handles audio streaming and ASR communication
- `GameChannel`: Manages game state synchronization and multiplayer features
- `PresenceChannel`: Tracks online players for multiplayer mode

### Latency Optimization
- WebSocket connection with persistent channels
- Streaming ASR for partial results
- Optimistic UI updates with rollback capability
- Edge deployment for geographic proximity

## Game Modes

### Solo Mode (Primary Focus)
Single-player experience focusing on:
- Tutorial and onboarding with basic voice commands
- Progressive vocabulary introduction through gameplay
- Personal pronunciation improvement tracking
- Offline-capable PWA for mobile learning

### Multiplayer Mode (Future)
Collaborative language learning:
- Real-time voice chat with other learners
- Cooperative quests requiring communication
- Language exchange partnerships
- Competitive pronunciation challenges

## Development Priority

### Phase 1: Core Solo Experience
1. **Index/Landing Page**: Game introduction and voice setup
2. **Solo Tutorial**: First 5-10 voice commands with immediate feedback
3. **Basic Game Loop**: Simple world navigation using voice
4. **Voice Pipeline**: Reliable <500ms voice-to-action latency

### Phase 2: Enhanced Solo Features
1. **Expanded Vocabulary**: 50+ commands across different categories
2. **Game Progression**: Multiple levels/worlds
3. **Learning Analytics**: Progress tracking and pronunciation scoring
4. **PWA Features**: Offline mode and mobile optimization

### Phase 3: Multiplayer Integration
1. **Real-time Communication**: Voice chat between players
2. **Presence System**: Online player tracking
3. **Cooperative Gameplay**: Multi-player voice-controlled quests
4. **Social Features**: Friends, leaderboards, challenges

## Game Mechanics

### Voice Commands (Solo Mode Priority)
**Movement Commands**:
- "go north/south/east/west"
- "move forward/backward"
- "turn left/right"

**Interaction Commands**:
- "pick up [item]"
- "use [item]"
- "look at [object]"
- "open [door/chest]"

**System Commands**:
- "inventory"
- "help"
- "repeat"
- "pause"

### Learning System
- Real-time pronunciation feedback with visual indicators
- Command recognition confidence scoring
- Adaptive difficulty based on pronunciation accuracy
- Vocabulary progression through contextual gameplay
- Achievement system for pronunciation milestones

## Development Setup

### Prerequisites
- Elixir 1.15+ and OTP 25+
- Phoenix 1.7+
- Node.js 18+ for asset compilation
- Deepgram API key for voice recognition

### Installation
```bash
mix deps.get
mix assets.setup
mix phx.server
```

### Testing
```bash
mix test                    # Backend tests
npm test --prefix assets   # Frontend tests
```

## Production Deployment

### Fly.io Configuration
- Multi-region deployment for low latency
- WebSocket clustering for horizontal scaling
- CDN integration for static assets
- Health checks and auto-scaling

### Environment Variables
- `DEEPGRAM_API_KEY`: Speech recognition service
- `SECRET_KEY_BASE`: Phoenix session encryption
- `DATABASE_URL`: PostgreSQL connection (future)

## Performance Targets

- Voice-to-action latency: <500ms end-to-end
- Audio streaming: 200-300ms chunks for real-time processing
- Game state updates: <100ms via Phoenix PubSub
- PWA loading: <2s initial load on 3G networks

## Security Considerations

- Voice data processing in memory only, no persistent storage
- WebSocket authentication via Phoenix tokens
- Rate limiting for API calls to prevent abuse
- CSP headers for XSS protection

## Scaling Strategy

1. **Horizontal Scaling**: Phoenix clustering with distributed state
2. **Voice Processing**: Queue system for high-volume ASR requests
3. **CDN**: Geographic distribution of static assets
4. **Caching**: Redis for frequently accessed game data

This architecture enables real-time voice-controlled gameplay while maintaining sub-500ms latency requirements essential for immersive language learning experiences.

BobaTalkie is built with Elixir and Phoenix framework.
