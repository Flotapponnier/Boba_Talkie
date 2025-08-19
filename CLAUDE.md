# BobaTalkie - Claude Development Context

## Claude Code Workflow
This project uses Claude Code with automatic CLAUDE.md loading:
- ✅ **Auto-context**: Claude Code automatically reads this file on startup
- ✅ **Real-time updates**: Changes to this file are immediately available
- ✅ **Multi-tool execution**: Can run multiple commands in parallel
- ✅ **Phoenix integration**: Understands Elixir/Phoenix toolchain
- 🔄 **Self-updating**: This file evolves with the codebase

## Current Status: MULTI-LANGUAGE VOICE LEARNING PLATFORM ✅
**Phase 4 Complete**: Full Internationalization with Dual Language System
**Ready for Production**: Complete tutorial and gameplay system with 9 interface languages and 9 learning languages

## Project Summary
Multi-language voice-controlled language learning platform built with Phoenix LiveView. Players select their interface language and target learning language, choose from 9 different learning topics, complete tutorials, and play voice-controlled games where they navigate a 2D grid world to complete sentence challenges using proper pronunciation.

## Internationalization Architecture ✅

### Dual Language System
**Interface Language**: Controls the app's UI, navigation, and instructions (what the user sees)
**Learning Language**: Controls the learning content, vocabulary, and challenges (what the user studies)

### Supported Languages (9 each)
- 🇺🇸 **English** - en
- 🇫🇷 **French** - fr  
- 🇪🇸 **Spanish** - es
- 🇨🇳 **Chinese** - zh (with pinyin support)
- 🇷🇺 **Russian** - ru
- 🇯🇵 **Japanese** - ja
- 🇮🇹 **Italian** - it
- 🇸🇦 **Arabic** - ar (RTL support)
- 🇵🇹 **Portuguese** - pt

### Language Selection & Persistence
- **Top-right corner**: Interface language selector (compact dropdown with flags)
- **Map selection page**: Learning language selector (prominent selector for target language)
- **Browser Storage**: Languages saved to localStorage for session persistence
- **URL Parameters**: Language state maintained across navigation
- **Session Persistence**: Preferences survive page reloads and browser restarts
- **Immediate Translation**: Text changes instantly when language is selected
- **LocalePlug Integration**: Server-side locale management with Phoenix sessions

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
│   ├── world.ex        # Multi-language 2D grid system
│   ├── player.ex       # Player position and actions  
│   └── card.ex         # Learning language-aware challenge system
├── language_manager.ex # Interface/Learning language separation
├── content_manager.ex  # Learning content in multiple languages
└── application.ex

lib/boba_talkie_web/
├── live/
│   ├── index_live.ex           # Landing page with interface language selector
│   ├── map_selection_live.ex   # 9-topic selection with dual language selectors
│   ├── tutorial_live.ex        # Multi-language vocabulary tutorials
│   ├── game_live.ex            # Learning language-aware gameplay
│   └── game_livemodules/       # Modular game components
│       ├── state_manager.ex    # Multi-language state management
│       ├── voice_handlers.ex   # Voice event processing
│       ├── movement_handlers.ex # Grid navigation logic
│       └── ui_helpers.ex       # Template utilities
├── components/
│   └── language_selector.ex   # Dual language selection components
└── router.ex                   # Multi-language routing
```

### Voice Commands & Gameplay
**Movement Commands:**
- "go north" → player.y -= 1
- "go south" → player.y += 1  
- "go east" → player.x += 1
- "go west" → player.x -= 1
- "look around" → describe surrounding cells

**Challenge Commands (Learning Language-Specific):**
- Stand on object + speak card sentence in learning language
- Example: Stand on 🍎 + say "Mange la pomme" (French) or "Eat the apple" (English)
- Cards completed → pronunciation score + progress tracking
- Content adapts based on selected learning language

## Current Implementation Status
- ✅ **Complete 9-Topic Multi-Language Learning System**
- ✅ **Full Internationalization**: 9 interface languages + 9 learning languages
- ✅ **Complete Translation System**: All UI text translated in 9 languages using Phoenix Gettext
- ✅ **Language Persistence**: Browser localStorage + URL parameters + Phoenix sessions
- ✅ **Dual Language Selection**: Interface language (top-right) + Learning language (map page)
- ✅ Index page with microphone setup and interface language selector
- ✅ Map selection with 9 beautifully designed topic cards and dual language selectors
- ✅ Interactive tutorials with multi-language pronunciation guides
- ✅ Learning language-aware 2D grid world system (6x6 with localized content)
- ✅ Challenge card system with learning language-specific sentence templates
- ✅ Player movement with collision detection and voice commands
- ✅ Real-time LiveView updates and state management
- ✅ Complete navigation flow: Index → Maps → Tutorial → Game
- ✅ **Chinese Pinyin Support**: Integrated pronunciation guide system
- ✅ **Content Management**: Separated interface translations from learning content
- 🔄 **Ready for Voice Integration**: Deepgram ASR integration
- ⏳ **Future**: Voice recognition in multiple languages, multiplayer modes

## Ready to Test
Run `mix phx.server` and visit:
- **http://localhost:4000** → Landing page with interface language selector
- **http://localhost:4000/maps** → Choose learning language + 9 topics
- **http://localhost:4000/tutorial/[topic]?interface_language=[lang]&learning_language=[lang]** → Multi-language tutorials
- **http://localhost:4000/game/[topic]?interface_language=[lang]&learning_language=[lang]** → Localized gameplay

**Available Topics**: introduction, fruits, numbers, colors, bakery, animals, restaurant, family, countries
**Interface Languages**: en, fr, es, zh, ru, ja, it, ar, pt (interface/navigation)
**Learning Languages**: en, fr, es, zh, ru, ja, it, ar, pt (content/vocabulary)

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
- `lib/boba_talkie_web/router.ex` - Route definitions with LocalePlug
- `assets/js/app.js` - Frontend JavaScript entry point

## Translation Architecture
### File Structure
```
lib/boba_talkie/
├── language_manager.ex        # Interface language definitions with flags
├── content_manager.ex         # Learning content in different languages
└── plugs/locale_plug.ex       # Server-side locale management

lib/boba_talkie_web/
├── components/
│   └── language_selector.ex   # Dual language selector components
└── live/
    ├── language_hook.ex       # LiveView language persistence
    └── language_session.ex    # Language session utilities

priv/gettext/
├── [lang]/LC_MESSAGES/
│   ├── default.po            # Interface translations
│   └── errors.po             # Error translations
├── default.pot               # Translation template
└── [9 languages complete]    # pt, fr, es, zh, ru, ja, it, ar, en

assets/js/hooks/
└── language_persistence.js   # Browser localStorage integration
```

### Translation Flow
1. **User selects language** → JavaScript `LanguagePersistence` hook
2. **Store in localStorage** → Browser persistence across sessions  
3. **Redirect with URL params** → `?interface_language=pt&learning_language=fr`
4. **LocalePlug processes** → Sets Phoenix session + Gettext locale
5. **LiveView renders** → All `gettext()` calls return translated text
6. **Language persists** → Across navigation, reloads, and browser restarts

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
- ✅ **Complete Internationalization**: 9 interface languages with full translation system
- ✅ **Language Persistence**: Browser localStorage + URL parameters + Phoenix sessions
- ✅ **Dual Language Architecture**: Separate interface and learning language selection
- ✅ **Translation Infrastructure**: Phoenix Gettext with complete .po files for all languages
- ✅ **Multi-Level System**: Expanded from single fruit level to 9 complete topics
- ✅ **Tutorial System**: Interactive vocabulary learning with pronunciations
- ✅ **Topic-Aware Architecture**: Modular system supporting unlimited topics
- ✅ **Card Challenge System**: Dynamic sentence completion challenges per topic
