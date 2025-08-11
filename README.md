# BobaTalkie - Voice-Controlled Language Learning Game

## Introduction
BobaTalkie is a voice-controlled language learning game that transforms vocabulary acquisition into an interactive gaming experience. Players navigate through different learning topics by speaking commands and completing pronunciation challenges. The game combines 2D grid navigation with topic-specific vocabulary learning, making language acquisition engaging and effective.

## Project Overview

BobaTalkie features a **4-level learning system** where players choose from different topics (Self-Introduction, Fruits & Food, Numbers, Colors), complete interactive tutorials, and then play voice-controlled games. Each level includes topic-specific vocabulary, pronunciation guides, and challenge cards that players complete by standing on objects and speaking sentences correctly.

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
├── game/               # Topic-aware game logic
│   ├── world.ex       # Topic-specific 2D grid system  
│   ├── player.ex      # Player state and actions
│   └── card.ex        # Challenge card system with topic templates
└── application.ex     # Application supervision tree

lib/boba_talkie_web/
├── live/
│   ├── index_live.ex           # Landing page with mic setup
│   ├── map_selection_live.ex   # 4-level topic selection
│   ├── tutorial_live.ex        # Interactive vocabulary tutorials
│   ├── game_live.ex            # Topic-aware gameplay
│   └── game_livemodules/       # Modular game components
└── router.ex                   # Multi-topic routing system
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

1. **Topic Selection**: Players choose from 4 learning topics on the map selection screen
2. **Tutorial (Optional)**: Interactive vocabulary learning with pronunciations and examples
3. **Game Setup**: Topic-specific 2D grid world generated with appropriate objects
4. **Voice Navigation**: Players move through the grid using voice commands ("go north", etc.)
5. **Challenge Cards**: Complete sentence templates by speaking while standing on objects
6. **Progress Tracking**: Real-time feedback, pronunciation scoring, and completion tracking

## Learning Topics

### 1. 👋 Self-Introduction (15 vocabulary items)
- **Objects**: Hello, Name, Nice to meet you, Thank you
- **Challenges**: "Say hello to greet someone", "My name is Sarah"

### 2. 🍎 Fruits & Food (20 vocabulary items)  
- **Objects**: Apple, Banana, Orange, Grape
- **Challenges**: "Eat the apple", "This is a banana", "The banana is yellow"

### 3. 1️⃣ Numbers (12 vocabulary items)
- **Objects**: One, Two, Three, Four
- **Challenges**: "Count to three", "I have two apples", "Step one forward"

### 4. 🌈 Colors (16 vocabulary items)
- **Objects**: Red, Blue, Green, Yellow
- **Challenges**: "The sky is blue", "My shirt is red", "The grass is green"

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

Visit http://localhost:4000 to start playing!

### Available Routes
- **/** - Landing page with microphone setup
- **/maps** - Choose from 4 learning topics  
- **/tutorial/[topic]** - Interactive vocabulary tutorials
- **/game/[topic]** - Voice-controlled gameplay

**Topics**: introduction, fruits, numbers, colors

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
