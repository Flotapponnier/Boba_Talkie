# BobaTalkie - Claude Development Context

## Claude Code Workflow
This project uses Claude Code with automatic CLAUDE.md loading:
- ✅ **Auto-context**: Claude Code automatically reads this file on startup
- ✅ **Real-time updates**: Changes to this file are immediately available
- ✅ **Multi-tool execution**: Can run multiple commands in parallel
- ✅ **Phoenix integration**: Understands Elixir/Phoenix toolchain
- 🔄 **Self-updating**: This file evolves with the codebase

## Current Status: MULTI-LEVEL LANGUAGE LEARNING GAME ✅
**Phase 3 Complete**: 9-Level Voice-Controlled Learning System
**Ready for Production**: Complete tutorial and gameplay system with expanded topic-aware content

## Project Summary
Voice-controlled language learning game built with Phoenix LiveView. Players choose from 9 different learning topics, complete tutorials, and play voice-controlled games where they navigate a 2D grid world to complete sentence challenges using proper pronunciation.

## Game Levels & Content
**9 Complete Learning Topics**:

### 1. 👋 Self-Introduction
- **Tutorial**: 15 greeting/introduction phrases
- **Game Objects**: Hello (👋), Name (📛), Nice to meet you (🤝), Thank you (🙏)
- **Card Challenges**: "Say _ to greet someone", "My _ is Sarah", etc.

### 2. 🍎 Fruits & Food  
- **Tutorial**: 20 fruit and food vocabulary items
- **Game Objects**: Apple (🍎), Banana (🍌), Orange (🍊), Grape (🍇)
- **Card Challenges**: "Eat the _", "This is a _", "The _ is yellow", etc.

### 3. 1️⃣ Numbers
- **Tutorial**: 12 counting and number vocabulary
- **Game Objects**: One (1️⃣), Two (2️⃣), Three (3️⃣), Four (4️⃣)
- **Card Challenges**: "Count to _", "I have _ apples", "Step _ forward", etc.

### 4. 🌈 Colors
- **Tutorial**: 16 color vocabulary and descriptions
- **Game Objects**: Red (🔴), Blue (🔵), Green (🟢), Yellow (🟡), Orange (🟠), Purple (🟣), Pink (🩷), Brown (🤎), Black (⚫), White (⚪), Gray (🩶)
- **Card Challenges**: "The sky is _", "My shirt is _", "The grass is _", "I like the color _", etc.

### 5. 🥐 Bakery
- **Tutorial**: Bakery and ordering vocabulary
- **Game Objects**: Bread (🍞), Croissant (🥐), Bagel (🥯), Pretzel (🥨), Baguette (🥖), Cake (🎂), Cupcake (🧁), Donut (🍩), Cookie (🍪), Pie (🥧)
- **Card Challenges**: "I want a _", "This _ is delicious", "How much is the _", "I'll take two _", etc.

### 6. 🐶 Animals
- **Tutorial**: Animal vocabulary and descriptions
- **Game Objects**: Dog (🐶), Cat (🐱), Rabbit (🐰), Bear (🐻), Panda (🐼), Lion (🦁), Tiger (🐯), Elephant (🐘), Monkey (🐵), Horse (🐴), Cow (🐄), Pig (🐷)
- **Card Challenges**: "The _ is cute", "I have a pet _", "The _ lives in the jungle", "I saw a _ at the zoo", etc.

### 7. 🍕 Restaurant
- **Tutorial**: Restaurant and ordering vocabulary
- **Game Objects**: Menu (📋), Pizza (🍕), Burger (🍔), Fries (🍟), Pasta (🍝), Salad (🥗), Soup (🍲), Coffee (☕), Water (💧), Bill (🧾)
- **Card Challenges**: "I'd like to order _", "Can I have the _", "I'll drink _", "The _ is ready", etc.

### 8. 👨‍👩‍👧‍👦 Family
- **Tutorial**: Family relationships and descriptions
- **Game Objects**: Mother (👩), Father (👨), Sister (👧), Brother (👦), Grandmother (👵), Grandfather (👴), Baby (👶), Family (👨‍👩‍👧‍👦), Aunt (👸), Uncle (🤴)
- **Card Challenges**: "This is my _", "I have two _", "My _ is kind", "I love my _", etc.

### 9. 🇹🇼 Countries
- **Tutorial**: Countries, nationalities, and cultural expressions
- **Game Objects**: Taiwan (🇹🇼), France (🇫🇷), Germany (🇩🇪), Japan (🇯🇵), USA (🇺🇸), UK (🇬🇧), Italy (🇮🇹), Spain (🇪🇸), China (🇨🇳), Canada (🇨🇦)
- **Card Challenges**: "I am from _", "He is _", "I eat bretzel in _", "I visited _", etc.

## Tech Stack
- **Backend**: Elixir/Phoenix with LiveView
- **Real-time**: Phoenix Channels over WebSockets
- **Voice**: Deepgram API for streaming ASR
- **Frontend**: LiveView + PWA capabilities
- **Deployment**: Fly.io

## Game Architecture (Topic-Aware System)

### Navigation Flow
```
Index Page → Map Selection → Tutorial (optional) → Game Play
     ↓              ↓               ↓                ↓
Mic Setup    Choose Topic    Learn Vocabulary   Voice Challenges
```

### Map Structure
```
Grid: 6x6 2D array (topic-specific objects)
0 = wall/obstacle (black)
1 = walkable space (white/green)  
2 = player position (blue)
3 = interactive objects (topic-specific emojis)

Example - Colors Level:
[1,1,1,0,0,1]
[1,2,1,0,3,1]  # 2=player, 3=🔴 (red object)
[1,1,1,0,0,1]
```

### Code Architecture
```
lib/boba_talkie/
├── game/
│   ├── world.ex        # Topic-aware 2D grid system
│   ├── player.ex       # Player position and actions  
│   └── card.ex         # Challenge card system with topic templates
└── application.ex

lib/boba_talkie_web/
├── live/
│   ├── index_live.ex           # Landing page with mic setup
│   ├── map_selection_live.ex   # 4-level topic selection
│   ├── tutorial_live.ex        # Interactive vocabulary tutorials
│   ├── game_live.ex            # Topic-aware gameplay
│   └── game_livemodules/       # Modular game components
│       ├── state_manager.ex    # Topic-aware state management
│       ├── voice_handlers.ex   # Voice event processing
│       ├── movement_handlers.ex # Grid navigation logic
│       └── ui_helpers.ex       # Template utilities
└── router.ex                   # Multi-topic routing
```

### Voice Commands & Gameplay
**Movement Commands:**
- "go north" → player.y -= 1
- "go south" → player.y += 1  
- "go east" → player.x += 1
- "go west" → player.x -= 1
- "look around" → describe surrounding cells

**Challenge Commands (Topic-Specific):**
- Stand on object + speak card sentence
- Example: Stand on 🍎 + say "Eat the apple"
- Cards completed → pronunciation score + progress tracking

## Current Implementation Status
- ✅ **Complete 4-Level Learning System**
- ✅ Index page with microphone setup and voice testing
- ✅ Map selection with 4 beautifully designed level cards
- ✅ Interactive tutorials with pronunciation guides
- ✅ Topic-aware 2D grid world system (6x6 with topic-specific objects)
- ✅ Challenge card system with topic-specific sentence templates
- ✅ Player movement with collision detection and voice commands
- ✅ Real-time LiveView updates and state management
- ✅ Complete navigation flow: Index → Maps → Tutorial → Game
- 🔄 **Ready for Voice Integration**: Deepgram ASR integration
- ⏳ **Future**: Multiplayer modes and additional topics

## Ready to Test
Run `mix phx.server` and visit:
- **http://localhost:4000** → Landing page with microphone setup
- **http://localhost:4000/maps** → Choose from 9 learning topics
- **http://localhost:4000/tutorial/[topic]** → Interactive vocabulary tutorials
- **http://localhost:4000/game/[topic]** → Voice-controlled gameplay

**Available Topics**: introduction, fruits, numbers, colors, bakery, animals, restaurant, family, countries

## Development Commands (Makefile)
```bash
# Quick start
make help          # Show all available commands  
make setup         # First-time project setup
make server        # Start development server (alias: make dev, make start)

# Development workflow  
make test          # Run all tests (alias: make t)
make test-watch    # Run tests in watch mode (alias: make tw)
make format        # Format code (alias: make fmt, make f)
make lint          # Run linter and static analysis

# Utilities
make shell         # Start IEx shell with project loaded
make doctor        # Check project health and versions
make clean         # Clean all build artifacts

# Direct Phoenix commands (if needed)
mix phx.server     # Start server
mix test           # Run tests  
mix deps.get       # Install dependencies
```

## Key Phoenix Files
- `lib/boba_talkie_web/endpoint.ex` - WebSocket and LiveView configuration
- `lib/boba_talkie_web/router.ex` - Route definitions
- `assets/js/app.js` - Frontend JavaScript entry point

## Voice Processing Flow
1. Browser captures audio via MediaRecorder
2. Stream audio chunks to Phoenix Channel
3. Forward to Deepgram for real-time ASR
4. Parse commands and update game state
5. Send feedback to LiveView for UI update

## Performance Targets
- Voice-to-action latency: <500ms end-to-end
- Audio streaming: 200-300ms chunks
- Game state updates: <100ms via PubSub

## Development Guidelines
- Prioritize solo mode functionality first
- Maintain real-time responsiveness
- Follow Elixir/Phoenix conventions
- Keep voice processing in memory only
- Optimize for mobile PWA experience

## Architecture Rules

### Modular File Organization
**Rule**: For each file when implementing significant functionality, if relevant, create a directory with the name of file followed by "modules" (e.g., `file_namemodules/`) and import it in the parent directory for better architecture.

**Examples**:
```
lib/boba_talkie/game/
├── world.ex                    # Main module
├── worldmodules/              # Modular components
│   ├── grid_renderer.ex       # Grid rendering logic
│   ├── collision_detector.ex  # Collision detection
│   ├── map_generator.ex       # Map generation utilities
│   └── position_calculator.ex # Position math
└── player.ex

lib/boba_talkie/voice/
├── deepgram.ex                # Main API client
├── deepgrammodules/           # Modular components
│   ├── audio_processor.ex     # Audio format handling
│   ├── response_parser.ex     # API response parsing
│   ├── streaming_client.ex    # Real-time streaming
│   └── error_handler.ex       # Error management
└── recognizer.ex

lib/boba_talkie_web/live/
├── game_live.ex              # Main LiveView
├── game_livemodules/         # LiveView modules
│   ├── voice_handlers.ex     # Voice event handlers
│   ├── movement_handlers.ex  # Movement logic
│   ├── ui_helpers.ex         # Template helpers
│   └── state_manager.ex      # State management
└── index_live.ex
```

**When to Apply**:
- ✅ File > 200 lines
- ✅ Multiple distinct responsibilities
- ✅ Complex logic that can be separated
- ✅ Reusable components across modules
- ❌ Simple, single-purpose modules
- ❌ Files with minimal logic

### Debug Logging Configuration
**Rule**: Environment-based debug logging for production and development with configurable error printing.

**Environment Variables**:
```bash
# .env file
DEBUG_ENABLED=true          # Enable/disable debug logging
DEBUG_LEVEL=debug           # debug, info, warn, error
PRINT_ERRORS=true           # Print detailed errors
VOICE_DEBUG=true            # Voice-specific debugging
GAME_DEBUG=true             # Game logic debugging
```

**Implementation**:
- Use environment-controlled logging throughout codebase
- Separate debug levels for different subsystems
- Production-safe error handling with optional detailed output
- Performance-conscious debug statements

## Next Development Priorities
1. **Voice Integration**: Complete Deepgram ASR integration for real voice commands
2. **Advanced Features**: Add pronunciation scoring and feedback system
3. **Additional Topics**: Expand to more learning categories (animals, actions, etc.)
4. **Multiplayer Mode**: Real-time collaborative learning sessions
5. **PWA Enhancement**: Optimize for mobile-first offline experience
6. **Analytics**: Track learning progress and pronunciation improvement

## Recent Achievements
- ✅ **Multi-Level System**: Expanded from single fruit level to 4 complete topics
- ✅ **Tutorial System**: Interactive vocabulary learning with pronunciations
- ✅ **Topic-Aware Architecture**: Modular system supporting unlimited topics
- ✅ **Card Challenge System**: Dynamic sentence completion challenges per topic
