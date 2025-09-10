# BobaTalkie - Multi-Language Voice Learning Platform

## Introduction
BobaTalkie is a comprehensive multi-language voice-controlled learning platform that transforms vocabulary acquisition into an interactive gaming experience. Players can choose from **solo or multiplayer modes**, navigate through 9 different learning topics by speaking commands, and complete pronunciation challenges with real-time feedback. The platform supports **9 interface languages** and **9 learning languages**, with integrated **video conferencing** for multiplayer collaboration.

## Project Overview

BobaTalkie features a **complete dual-language learning system** with both **single-player** and **multiplayer (1vs1)** modes:

### Learning System
- **9 Topics**: Self-Introduction, Fruits & Food, Numbers, Colors, Bakery, Animals, Restaurant, Family, Countries
- **9 Interface Languages**: English, French, Spanish, Chinese, Russian, Japanese, Italian, Arabic, Portuguese
- **9 Learning Languages**: Complete content in all supported languages with pronunciation guides
- **Interactive Tutorials**: Multi-language vocabulary learning with romanization support (Chinese pinyin, etc.)
- **Challenge Cards**: Language-specific sentence completion challenges

### Game Modes
- **Solo Mode**: Individual learning with voice navigation and challenge completion
- **Multiplayer Mode (NEW)**: 1vs1 collaborative learning with integrated video chat
  - **Language Matching**: Players matched by learning language (French learners only match with French learners)
  - **Video Conferencing**: Built-in WebRTC peer-to-peer video calling
  - **Voice Recording Mutex**: Turn-based speaking system - only one player can record at a time
  - **Private Parties**: Create shareable room links with custom topic selection
  - **Random Matching**: Automatic matchmaking with random topic selection

## Architecture

### Tech Stack
- **Backend**: Elixir/Phoenix with LiveView for real-time UI updates
- **Real-time Communication**: Phoenix Channels + PubSub for game state synchronization
- **Multiplayer**: GenServer-based room management with WebRTC peer-to-peer video
- **Speech Recognition**: Deepgram API for streaming ASR (Automatic Speech Recognition)
- **Video Conferencing**: WebRTC with STUN servers for direct peer connection
- **Internationalization**: Phoenix Gettext with complete 9-language support
- **Frontend**: Phoenix LiveView with PWA capabilities for mobile-first design
- **Deployment**: Fly.io for global edge deployment

### System Components

#### Backend Architecture (lib/)
```
lib/boba_talkie/
├── game/                    # Topic-aware game logic
│   ├── world.ex            # Topic-specific 2D grid system  
│   ├── player.ex           # Player state and actions
│   └── card.ex             # Challenge card system with topic templates
├── multiplayer_room.ex     # GenServer for room management and player matching
├── content_manager.ex      # Multi-language learning content system
├── language_manager.ex     # Interface language definitions and flags
└── application.ex          # Application supervision tree

lib/boba_talkie_web/
├── live/
│   ├── index_live.ex           # Landing page with solo/multiplayer selection
│   ├── map_selection_live.ex   # 9-topic selection with dual language system
│   ├── tutorial_live.ex        # Multi-language vocabulary tutorials
│   ├── game_live.ex            # Single-player gameplay
│   ├── multiplayer_lobby_live.ex    # Multiplayer matchmaking and room creation
│   ├── multiplayer_game_live.ex     # 1vs1 gameplay with video chat integration
│   └── game_livemodules/       # Modular game components
├── components/
│   └── language_selector.ex   # Dual language selection components
└── router.ex                   # Multi-mode routing system
```

#### Frontend Architecture (assets/)
```
assets/
├── js/
│   ├── hooks/
│   │   ├── voice_capture.js           # Main voice capture hook
│   │   ├── voice_capturemodules/      # Modular voice components
│   │   │   ├── keyboard_handler.js    # R key press-to-talk
│   │   │   ├── button_state_manager.js # UI state management
│   │   │   ├── web_speech_handler.js   # Web Speech API integration
│   │   │   └── media_recorder_handler.js # MediaRecorder fallback
│   │   ├── webrtc_video.js            # WebRTC peer-to-peer video conferencing
│   │   ├── clipboard_copy.js          # Room link sharing functionality
│   │   ├── language_persistence.js    # Language preference storage
│   │   ├── floating_clouds.js         # Background animations
│   │   └── microphone_test.js         # Mic permission testing
│   └── app.js                         # Main application entry with multiplayer hooks
├── css/               # Tailwind CSS styling with game-specific modules
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

1. **Topic Selection**: Players choose from 9 learning topics on the map selection screen
2. **Tutorial (Optional)**: Interactive vocabulary learning with pronunciations and examples
3. **Game Setup**: Topic-specific 2D grid world generated with appropriate objects (3-8 random items per topic)
4. **Voice Navigation**: Players move through the grid using voice commands ("go north", "move two steps left", etc.)
5. **Challenge Cards**: Complete sentence templates by speaking while standing on objects
6. **Progress Tracking**: Real-time feedback, pronunciation scoring, and completion tracking

## Learning Topics

### 1. 👋 Self-Introduction (15 vocabulary items, 4-7 random objects per game)
- **Objects**: Hello 👋, Name 📛, Nice to meet you 🤝, How are you 😊, Fine 👌, Thank you 🙏, Please 🥺, Excuse me 🙋, Sorry 😔, Yes ✅, No ❌, Goodbye 👋, See you later 🔄, Where 📍, From 🏠
- **Challenges**: "Say _ to greet someone", "My _ is Sarah", "I am _", "The answer is _"

### 2. 🍎 Fruits & Food (20 vocabulary items, 4-8 random objects per game)  
- **Objects**: Apple 🍎, Banana 🍌, Orange 🍊, Grape 🍇, Strawberry 🍓, Cherry 🍒, Peach 🍑, Pineapple 🍍, Watermelon 🍉, Lemon 🍋, Avocado 🥑, Coconut 🥥, Mango 🥭, Kiwi 🥝, Tomato 🍅, Carrot 🥕, Bread 🍞, Milk 🥛, Cheese 🧀, Egg 🥚
- **Challenges**: "Eat the _", "This is a _", "The _ is yellow", "I like _"

### 3. 1️⃣ Numbers (10 vocabulary items, 3-6 random objects per game)
- **Objects**: One 1️⃣, Two 2️⃣, Three 3️⃣, Four 4️⃣, Five 5️⃣, Six 6️⃣, Seven 7️⃣, Eight 8️⃣, Nine 9️⃣, Ten 🔟
- **Challenges**: "Count to _", "I have _ apples", "Step _ forward", "The number _ is my favorite"

### 4. 🌈 Colors (11 vocabulary items, 3-8 random objects per game)
- **Objects**: Red 🔴, Blue 🔵, Green 🟢, Yellow 🟡, Orange 🟠, Purple 🟣, Pink 🩷, Brown 🤎, Black ⚫, White ⚪, Gray 🩶
- **Challenges**: "The sky is _", "My shirt is _", "I like the color _", "The grass is _"

### 5. 🥐 Bakery (10 vocabulary items, 4-7 random objects per game)
- **Objects**: Bread 🍞, Croissant 🥐, Bagel 🥯, Pretzel 🥨, Baguette 🥖, Cake 🎂, Cupcake 🧁, Donut 🍩, Cookie 🍪, Pie 🥧
- **Challenges**: "I want a _", "This _ is delicious", "How much is the _", "I'll take two _"

### 6. 🐶 Animals (12 vocabulary items, 4-8 random objects per game)
- **Objects**: Dog 🐶, Cat 🐱, Rabbit 🐰, Bear 🐻, Panda 🐼, Lion 🦁, Tiger 🐯, Elephant 🐘, Monkey 🐵, Horse 🐴, Cow 🐄, Pig 🐷
- **Challenges**: "The _ is cute", "I have a pet _", "The _ lives in the jungle", "I saw a _ at the zoo"

### 7. 🍕 Restaurant (10 vocabulary items, 4-7 random objects per game)
- **Objects**: Menu 📋, Pizza 🍕, Burger 🍔, Fries 🍟, Pasta 🍝, Salad 🥗, Soup 🍲, Coffee ☕, Water 💧, Bill 🧾
- **Challenges**: "I'd like to order _", "Can I have the _", "I'll drink _", "The _ is ready"

### 8. 👨‍👩‍👧‍👦 Family (10 vocabulary items, 4-7 random objects per game)
- **Objects**: Mother 👩, Father 👨, Sister 👧, Brother 👦, Grandmother 👵, Grandfather 👴, Baby 👶, Family 👨‍👩‍👧‍👦, Aunt 👸, Uncle 🤴
- **Challenges**: "This is my _", "I have two _", "My _ is kind", "I love my _"

### 9. 🇹🇼 Countries (10 vocabulary items, 4-8 random objects per game)
- **Objects**: Taiwan 🇹🇼, France 🇫🇷, Germany 🇩🇪, Japan 🇯🇵, USA 🇺🇸, UK 🇬🇧, Italy 🇮🇹, Spain 🇪🇸, China 🇨🇳, Canada 🇨🇦
- **Challenges**: "I am from _", "He is _", "I eat bretzel in _", "I visited _"

## Real-time Architecture

### Phoenix Channels & PubSub
- **Phoenix PubSub**: Room-based communication for multiplayer state synchronization
- **WebRTC**: Direct peer-to-peer video/audio communication
- **LiveView**: Real-time UI updates for game state changes
- **GenServer**: Centralized room management and player matching

### Multiplayer Communication Flow
1. **Room Creation**: GenServer manages room state and player matching
2. **WebRTC Signaling**: LiveView handles ICE candidates and session descriptions
3. **Game Synchronization**: PubSub broadcasts game state changes between players
4. **Voice Mutex**: Server-side recording state management for turn-based speaking

### Latency Optimization
- WebSocket connection with persistent channels (<100ms game updates)
- Direct peer-to-peer WebRTC for video/audio (bypasses server)
- Streaming ASR for partial results
- Optimistic UI updates with rollback capability
- Edge deployment for geographic proximity

## Game Modes

### Solo Mode
Complete single-player experience:
- **Tutorial System**: Interactive vocabulary learning with pronunciation guides
- **Voice Navigation**: Navigate 6x6 grid worlds using voice commands
- **Challenge Cards**: Complete sentence templates by speaking while on objects
- **Progress Tracking**: Real-time feedback and completion statistics
- **Multi-Language Support**: Learn in any of 9 supported languages
- **Language Restriction**: Movement commands only work in selected learning language

### Multiplayer Mode (1vs1) ✅
Real-time collaborative language learning:
- **Video Conferencing**: Built-in WebRTC peer-to-peer video calling with camera/mic controls
- **Language Matching**: Players automatically matched by learning language
- **Voice Recording Mutex**: Turn-based speaking system prevents conflicts
- **Shared Game World**: Both players collaborate on the same 6x6 game grid
- **Real-time Synchronization**: Game state updates broadcast instantly between players
- **Private Rooms**: Create shareable room links with custom topic selection
- **Random Matching**: Automatic matchmaking with random topic selection
- **Room Management**: Join/leave functionality with proper cleanup
- **Connection Status**: Visual indicators for partner connection state

## Development Status

### ✅ Phase 1: Complete Multi-Language Platform (COMPLETE)
1. **Multi-Mode Landing Page**: Choose between Solo and Multiplayer (1vs1) modes
2. **Complete Internationalization**: 9 interface languages + 9 learning languages
3. **Solo Tutorial System**: Interactive vocabulary learning with multi-language content
4. **Multi-Language Game System**: 9 complete topics with language-specific content
5. **Advanced Voice Pipeline**: Language-restricted commands, auto-card detection

### ✅ Phase 2: Full Multiplayer Integration (COMPLETE)
1. **1vs1 Video Conferencing**: WebRTC peer-to-peer video calling
2. **Room Management**: GenServer-based multiplayer room system
3. **Language-Based Matching**: Players matched by learning language preference
4. **Voice Recording Mutex**: Turn-based speaking system with server-side state management
5. **Private Party System**: Shareable room links with custom topic selection
6. **Real-time Game Synchronization**: PubSub-based state broadcasting

### 🔄 Phase 3: Advanced Features (READY FOR EXPANSION)
1. **Voice Integration**: Complete Deepgram ASR implementation
2. **Phoenix.Presence**: Advanced online player tracking (optional)
3. **Learning Analytics**: Pronunciation scoring and progress tracking
4. **PWA Features**: Offline mode and mobile optimization

## Game Mechanics

### Voice Input Methods
**Mouse/Touch Input**:
- **Hold button**: Press and hold the "Hold to Speak" button to activate voice recording
- **Release**: Release button to stop recording and process voice command

**Keyboard Input** (NEW):
- **Hold R key**: Press and hold the "R" key to activate voice recording
- **Release R**: Release the R key to stop recording and process voice command
- **Cross-platform**: Works on desktop, tablet, and mobile devices with keyboard

### Voice Commands (Solo Mode Priority)
**Movement Commands**:
- "go north/south/east/west"
- "move forward/backward"  
- "turn left/right"
- "move two steps east" (numbered movement)

**Challenge Commands (Auto-Activated)**:
- Stand on object + speak sentence from challenge card (no click required)
- "Eat the apple", "The sky is blue", "My name is Sarah"
- Topic-specific vocabulary challenges with automatic detection
- Smart priority system: card challenges detected before movement commands
- Multi-language support: French, Spanish, Chinese, Russian, Japanese, Italian, Arabic, Portuguese, English

**System Commands**:
- "look around" - Describe surroundings
- "help" - Show available commands

### Learning System
- **Auto-Card System**: Cards activate automatically when player is on correct object and speaks matching sentence
- **Smart Detection**: Language-specific pattern recognition prevents conflicts (e.g., French "est" vs English "east")
- **Adaptive Cards**: Each game generates exactly one card per object present in the world
- **Unicode Support**: Full support for accented characters and international typography
- **Multi-Language Templates**: Cards translate to match selected learning language
- Real-time pronunciation feedback with visual indicators
- Command recognition confidence scoring
- Vocabulary progression through contextual gameplay
- Achievement system for pronunciation milestones

### Visual Game Features
**Grid-based World**:
- 6x6 game grid with topic-specific objects
- **Player highlighting**: Orange border around player position
- **Object highlighting**: Green borders around collectible objects 
- **Discovery notifications**: "You found a 🍎 (apple)!" when stepping on objects
- **Custom wallpaper**: Topic-themed backgrounds for immersive experience

**UI Enhancements**:
- Clean, emoji-free interface for professional appearance
- Responsive design for mobile, tablet, and desktop
- Real-time visual feedback for voice commands
- Topic-specific character images and color schemes

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

#### Solo Mode
- **/** - Landing page with solo/multiplayer mode selection
- **/maps** - Choose from 9 learning topics with dual language selection
- **/tutorial/[topic]** - Interactive multi-language vocabulary tutorials
- **/game/[topic]** - Single-player voice-controlled gameplay

#### Multiplayer Mode ✅
- **/multiplayer** - Multiplayer lobby with matchmaking and room creation
- **/multiplayer/[room_id]** - Join specific private room via shareable link
- **/multiplayer_game/[topic]** - 1vs1 collaborative gameplay with video chat

**Available Topics**: introduction, fruits, numbers, colors, bakery, animals, restaurant, family, countries
**Languages**: en, fr, es, zh, ru, ja, it, ar, pt (both interface and learning)

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
- `WEBRTC_STUN_SERVERS`: WebRTC STUN server configuration for peer connections

## Performance Targets

### Single-Player Mode
- Voice-to-action latency: <500ms end-to-end
- Audio streaming: 200-300ms chunks for real-time processing
- Game state updates: <100ms via Phoenix PubSub
- PWA loading: <2s initial load on 3G networks

### Multiplayer Mode ✅
- Room creation/joining: <200ms
- Video call establishment: <3s WebRTC peer connection
- Game state synchronization: <100ms via PubSub broadcast
- Voice recording mutex: <50ms server-side state updates
- Player matching: <1s for language-based matchmaking

## Security Considerations

### General Security
- Voice data processing in memory only, no persistent storage
- WebSocket authentication via Phoenix tokens
- Rate limiting for API calls to prevent abuse
- CSP headers for XSS protection

### Multiplayer Security ✅
- Room ID generation using cryptographically secure random bytes
- Server-side room state validation and player authentication
- WebRTC peer-to-peer connections (media bypasses server)
- PubSub topic isolation per room for secure communication
- Automatic room cleanup after 30 minutes of inactivity

## Scaling Strategy

### Current Architecture
1. **Horizontal Scaling**: Phoenix clustering with distributed state
2. **Voice Processing**: Queue system for high-volume ASR requests  
3. **CDN**: Geographic distribution of static assets
4. **Caching**: Redis for frequently accessed game data

### Multiplayer Scaling ✅
1. **GenServer Distribution**: Room management distributed across nodes
2. **WebRTC Direct Connection**: Peer-to-peer media reduces server load
3. **PubSub Clustering**: Phoenix PubSub supports multi-node broadcasting
4. **Room Lifecycle Management**: Automatic cleanup prevents memory leaks
5. **Regional Deployment**: STUN servers distributed globally for WebRTC optimization

## Summary

BobaTalkie is now a **complete multi-language voice learning platform** featuring:

### ✅ **Solo Mode**: Full single-player experience with 9 languages and 9 topics
### ✅ **Multiplayer Mode**: 1vs1 collaborative learning with integrated video conferencing
### ✅ **Multi-Language System**: Interface and learning language separation with complete internationalization  
### ✅ **Advanced Voice Features**: Language-restricted commands, auto-card detection, multi-language support
### ✅ **Production Ready**: Full WebRTC integration, room management, and real-time synchronization

This architecture enables both solo and collaborative real-time voice-controlled gameplay while maintaining sub-500ms latency requirements and <100ms multiplayer synchronization essential for immersive language learning experiences.

**Built with Elixir, Phoenix LiveView, WebRTC, and comprehensive multi-language support.**
