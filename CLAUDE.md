# BobaTalkie - Claude Development Context

## Claude Code Workflow
This project uses Claude Code with automatic CLAUDE.md loading:
- ✅ **Auto-context**: Claude Code automatically reads this file on startup
- ✅ **Real-time updates**: Changes to this file are immediately available
- ✅ **Multi-tool execution**: Can run multiple commands in parallel
- ✅ **Phoenix integration**: Understands Elixir/Phoenix toolchain
- 🔄 **Self-updating**: This file evolves with the codebase

## Current Status: COMPLETE MULTIPLAYER VOICE LEARNING PLATFORM ✅
**Phase 6 Complete**: Full Multiplayer Implementation with Video Conferencing
**Ready for Production**: Complete tutorial, single-player, and multiplayer system with 9 interface languages, 9 learning languages, language-specific voice command restrictions, and real-time 1vs1 multiplayer gaming with video chat

## Project Summary
Multi-language voice-controlled language learning platform built with Phoenix LiveView. Players select their interface language and target learning language, choose from 9 different learning topics, complete tutorials, and play voice-controlled games where they navigate a 2D grid world to complete sentence challenges using proper pronunciation. Features include both single-player learning and real-time multiplayer 1vs1 gaming with integrated video conferencing, language-based matching, and synchronized gameplay.

## Internationalization Architecture ✅

### Dual Language System Overview
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

### Language-Restricted Voice Commands ✅
- **Learning Language Only**: Movement commands only work in the selected learning language
- **Complete Restriction**: If learning French, English commands like "two times down" are blocked
- **Multi-Language Support**: All 9 languages have complete numbered movement patterns
  - **French**: "3 bas", "deux fois à droite", "va en haut"
  - **Russian**: "три север", "два вправо", "один раз влево"
  - **Italian**: "3 giù", "due volte destra", "uno su"
  - **Spanish**: "3 abajo", "dos derechas", "una vez izquierda"
  - **Chinese**: "三下", "二右", "一个左"
  - **Japanese**: "三北", "二右回", "一回左"
  - **Arabic**: "ثلاثة شمال", "اثنان يمين", "واحد مرة يسار"
  - **Portuguese**: "3 baixo", "duas direitas", "uma vez esquerda"

## Multi-Language System Architecture 🏗️

### Core Components

#### 1. ContentManager (`lib/boba_talkie/content_manager.ex`)
**Central hub for all learning content and translations**

**Learning Content Functions:**
```elixir
# Pattern: get_[topic]_content(language_code)
get_introduction_content("en")  # Returns English introduction content
get_introduction_content("es")  # Returns Spanish introduction content  
get_introduction_content("zh")  # Returns Chinese content with pinyin
get_introduction_content(_lang) # Fallback to English for unsupported languages
```

**Content Structure:**
```elixir
%{
  tutorial: [  # Tutorial vocabulary items
    %{
      id: "animal_dog",                    # Unique identifier
      word: "狗",                         # Learning language word
      emoji: "🐶",                        # Visual emoji
      pronunciation: "gǒu",               # Pronunciation guide
      romanization: "gǒu",                # Romanization (Chinese: pinyin, Japanese: romanization, Arabic: transliteration)
      meaning: "家庭动物",                 # Definition in learning language
      example: "狗是人类最好的朋友",        # Example sentence in learning language
      example_romanization: "gǒu shì..."  # Example sentence romanization
    }
  ],
  game_objects: [  # Objects that appear in 2D game world
    %{id: "animal_dog", emoji: "🐶", word: "狗", pronunciation: "gǒu", romanization: "gǒu"}
  ],
  cards: [  # Challenge card templates
    %{id: "animal_dog", template: "_很忠诚", answer: "狗", romanization: "gǒu", description: "描述宠物特征"}
  ]
}
```

**Interface Translation Mapping:**
```elixir
# Pattern: get_vocabulary_translations()
# Maps vocabulary IDs to interface language translations
%{
  "animal_dog" => %{
    "en" => %{word: "Dog", example: "The dog is man's best friend"},
    "fr" => %{word: "Chien", example: "Le chien est le meilleur ami de l'homme"},  
    "es" => %{word: "Perro", example: "El perro es el mejor amigo del hombre"},
    "zh" => %{word: "狗", example: "狗是人类最好的朋友"},
    "ru" => %{word: "Собака", example: "Собака - лучший друг человека"},
    # ... all 9 interface languages
  }
}
```

#### 2. Tutorial Display (`lib/boba_talkie_web/live/tutorial_live.ex`)
**Combines learning content with interface translations**

**Key Function:**
```elixir
def current_vocabulary_item_with_translation(content, index, interface_language) do
  item = Enum.at(content.vocabulary, index)
  if item && Map.has_key?(item, :id) do
    # Get interface language translation for this vocabulary ID
    translation = BobaTalkie.ContentManager.get_vocabulary_translation(item.id, interface_language)
    Map.put(item, :translation, translation)
  else
    item
  end
end
```

**Template Display Logic (`tutorial_live.html.heex`):**
```heex
<!-- Main vocabulary word (learning language) -->
<h2 class="text-3xl font-bold text-cute"><%= current_item.word %></h2>

<!-- Romanization for main word (pinyin, etc.) -->
<%= if Map.has_key?(current_item, :romanization) do %>
  <p class="text-sm text-blue-600 font-mono opacity-80">
    <span class="font-semibold">Pinyin:</span> <%= current_item.romanization %>
  </p>
<% end %>

<!-- Interface language translation -->
<%= if current_item.translation do %>
  <p class="text-lg text-gray-600 italic">(<%= current_item.translation.word %>)</p>
<% end %>

<!-- Example with romanization -->
<p class="text-blue-700 italic font-medium">"<%= current_item.example %>"</p>
<%= if Map.has_key?(current_item, :example_romanization) do %>
  <p class="text-blue-600 text-sm font-mono opacity-70">
    <span class="font-semibold">Romanization:</span> <%= current_item.example_romanization %>
  </p>
<% end %>

<!-- Interface language translation of example -->
<%= if current_item.translation && current_item.translation.example do %>
  <p class="text-blue-600 italic text-sm opacity-80">(<%= current_item.translation.example %>)</p>
<% end %>
```

### Language Implementation Status

#### ✅ **Fully Implemented Learning Languages**
**English** (`"en"`):
- Complete content for all 9 topics
- Base language for fallbacks

**Spanish** (`"es"`):
- Complete content for all topics: introduction, fruits, numbers, colors, bakery, animals, restaurant, family, countries
- Standard Latin pronunciation guides

**Chinese** (`"zh"`):
- Complete content for all topics with full pinyin support
- `romanization` field with pinyin for main words
- `example_romanization` field with pinyin for example sentences
- Standardized to use `romanization` (not `pinyin`) for template compatibility

#### 🔄 **Partially Implemented Learning Languages**
**French** (`"fr"`): Has some existing content but needs completion
**Italian** (`"it"`): Has some existing content but needs completion  
**Japanese** (`"ja"`): Has some existing content but needs romanization standardization
**Russian** (`"ru"`): Has some existing content but needs romanization support
**Arabic** (`"ar"`): Has some existing content but needs romanization support
**Portuguese** (`"pt"`): Has some existing content but needs completion

#### ✅ **Interface Translations (All Complete)**
All 9 interface languages have complete translation mappings for every vocabulary ID in the system.

### Adding New Learning Language Support

#### Step 1: Create Content Function
```elixir
# In ContentManager, add new function for each topic
defp get_animals_content("ja") do  # Japanese example
  %{
    tutorial: [
      %{
        id: "animal_dog", 
        word: "犬", 
        emoji: "🐶", 
        pronunciation: "inu", 
        romanization: "inu",                    # REQUIRED for template display
        meaning: "家庭の動物", 
        example: "犬は人間の最高の友達です",
        example_romanization: "inu wa ningen no saikou no tomodachi desu"  # REQUIRED for template display
      }
    ],
    game_objects: [
      %{id: "animal_dog", emoji: "🐶", word: "犬", pronunciation: "inu", romanization: "inu"}
    ],
    cards: [
      %{id: "animal_dog", template: "_は忠実です", answer: "犬", romanization: "inu", description: "ペットの特徴を説明"}
    ]
  }
end
```

#### Step 2: Add All Topics
Must create content functions for all 9 topics:
- `get_introduction_content("ja")`
- `get_fruits_content("ja")`  
- `get_numbers_content("ja")`
- `get_colors_content("ja")`
- `get_bakery_content("ja")`
- `get_animals_content("ja")`
- `get_restaurant_content("ja")`
- `get_family_content("ja")`
- `get_countries_content("ja")`

#### Step 3: Romanization Requirements
For languages requiring romanization support (Chinese, Japanese, Arabic, Russian):
- **MUST** include `romanization` field in tutorial items (for main word display)
- **MUST** include `example_romanization` field in tutorial items (for example sentences)
- **MUST** include `romanization` field in cards (for challenge answers)

#### Step 4: Template Automatic Support
Once the content functions exist with proper `romanization` fields, the template automatically displays:
- Main word with romanization below it
- Example sentences with romanization in pronunciation section
- No code changes needed in templates or LiveView modules

### Debugging Multi-Language Issues

#### Common Problems:
1. **Vocabulary shows English instead of chosen learning language**
   - Check if content function exists: `get_[topic]_content(language_code)`
   - Verify fallback is working: `get_[topic]_content(_lang)` should return English

2. **Missing pinyin/romanization for main word**
   - Ensure `romanization` field exists in tutorial items
   - Check template looks for `Map.has_key?(current_item, :romanization)`

3. **Missing interface language translations**
   - Verify vocabulary ID exists in `get_vocabulary_translations()` mapping
   - Check all 9 interface languages have translations for that ID

4. **Inconsistent romanization display**
   - Ensure all content uses `romanization` field (not `pinyin` or other variants)
   - Template only displays `romanization` field

### File Locations
- **Content Management**: `lib/boba_talkie/content_manager.ex`
- **Tutorial Logic**: `lib/boba_talkie_web/live/tutorial_live.ex`  
- **Tutorial Template**: `lib/boba_talkie_web/live/tutorial_live.html.heex`
- **Language Selection**: `lib/boba_talkie_web/components/language_selector.ex`
- **Language Persistence**: `lib/boba_talkie_web/live/language_hook.ex`

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
│   ├── index_live.ex           # Landing page with single-player and multiplayer options
│   ├── map_selection_live.ex   # 9-topic selection with dual language selectors
│   ├── tutorial_live.ex        # Multi-language vocabulary tutorials
│   ├── game_live.ex            # Single-player learning gameplay
│   ├── multiplayer_lobby_live.ex # Multiplayer matchmaking and private party system
│   ├── multiplayer_game_live.ex # 1vs1 multiplayer with video conferencing
│   └── game_livemodules/       # Modular game components
│       ├── state_manager.ex    # Multi-language state management
│       ├── voice_handlers.ex   # Voice event processing
│       ├── movement_handlers.ex # Grid navigation logic
│       └── ui_helpers.ex       # Template utilities
├── components/
│   └── language_selector.ex   # Dual language selection components
└── router.ex                   # Multi-language routing with multiplayer routes
```

## Multiplayer System Architecture ✅

### Core Multiplayer Components

#### 1. MultiplayerRoom GenServer (`lib/boba_talkie/multiplayer_room.ex`)
**Central hub for multiplayer game session management**

**Key Functions:**
- `find_or_create_match/2` - Language-based player matching
- `create_private_room/3` - Private party with shareable links  
- `join_room/3` - Join existing rooms with language validation
- `set_recording_state/3` - Voice recording mutex management

**Room State Structure:**
```elixir
%{
  id: room_id,
  type: :random | :private,
  learning_language: "fr",
  topic: "fruits" | :random,
  players: [player_id1, player_id2],
  status: :waiting | :ready | :in_game,
  host: player_id, # for private rooms
  recording_player: nil | player_id, # voice mutex
  created_at: DateTime
}
```

#### 2. MultiplayerLobbyLive (`lib/boba_talkie_web/live/multiplayer_lobby_live.ex`)
**Matchmaking and room creation interface**

**Features:**
- **Random Matching**: Auto-match players by learning language
- **Private Parties**: Generate shareable room links with custom topic selection
- **Language Validation**: Only match French learners with French learners, etc.
- **Real-time Updates**: Phoenix PubSub for instant match notifications

#### 3. MultiplayerGameLive (`lib/boba_talkie_web/live/multiplayer_game_live.ex`)
**1vs1 gameplay with integrated video conferencing**

**WebRTC Integration:**
- Peer-to-peer video/audio using `WebRTCVideo` JavaScript hook
- STUN servers for NAT traversal
- Real-time connection state management

**Voice Recording Mutex:**
- Only one player can record at a time
- Visual indicators for recording state
- Automatic blocking/unblocking system

#### 4. Multiplayer Navigation Flow
```
Index Page → Multiplayer Lobby → Matched Room → 1vs1 Game
     ↓              ↓                ↓           ↓
Select Mode    Find Match/Create    Wait/Join   Video Chat + Voice Game
             Private Party
```

### WebRTC Video Conferencing System

**Frontend Components:**
```
assets/js/hooks/
├── webrtc_video.js           # WebRTC peer connection management
├── clipboard_copy.js         # Room link sharing
└── language_persistence.js   # Session management
```

**Key Features:**
- **Direct P2P Connection**: No server video processing required
- **Camera/Mic Controls**: Toggle video and audio independently  
- **Connection Recovery**: Automatic reconnection on network issues
- **Cross-Browser Support**: Works on Chrome, Firefox, Safari, Edge

### Multiplayer Game Synchronization

**Real-time Features:**
- **Shared Game State**: Synchronized 2D world between players
- **Turn-Based Voice**: Mutex prevents overlapping speech
- **Progress Sharing**: Card completion visible to both players
- **Partner Feedback**: See your partner's recent actions

**PubSub Topics:**
- `multiplayer_room:#{room_id}` - Room lifecycle events
- `multiplayer_game:#{room_id}` - Game state synchronization

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
- ✅ **Complete Multiplayer System**: 1vs1 real-time gaming with video conferencing
- ✅ **WebRTC Video Chat**: Peer-to-peer video and audio communication
- ✅ **Voice Recording Mutex**: Only one player can speak at a time
- ✅ **Language-Based Matching**: Players matched by learning language
- ✅ **Private Party System**: Shareable room links for friends
- ✅ **Random Topic Selection**: Automatic topic assignment for matchmaking
- 🔄 **Ready for Voice Integration**: Deepgram ASR integration
- ⏳ **Future**: Voice recognition in multiple languages, advanced multiplayer features

## Ready to Test
Run `mix phx.server` and visit:

### Single Player Mode
- **http://localhost:4000** → Landing page with single-player and multiplayer options
- **http://localhost:4000/maps** → Choose learning language + 9 topics
- **http://localhost:4000/tutorial/[topic]?interface_language=[lang]&learning_language=[lang]** → Multi-language tutorials
- **http://localhost:4000/game/[topic]?interface_language=[lang]&learning_language=[lang]** → Solo gameplay

### Multiplayer Mode  
- **http://localhost:4000/multiplayer** → Multiplayer lobby with matchmaking and private party options
- **http://localhost:4000/multiplayer/[room_id]** → Join specific private room via shared link
- **http://localhost:4000/multiplayer_game/[topic]?room_id=[id]&player_id=[id]** → 1vs1 gameplay with video chat

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
- ✅ **Language-Restricted Commands**: Movement commands only work in the selected learning language
- ✅ **Expandable Card Descriptions**: +/- buttons to show/hide interface language translations
- ✅ **Complete Multi-Language Movement**: All 9 languages support numbered movement patterns

## Latest Technical Improvements ✅

### Auto-Card Challenge System (December 2024)
**Problem**: Players had to manually click cards before speaking, interrupting game flow.
**Solution**: Implemented automatic card detection and completion system.

**Key Changes**:
- **Removed card click requirement**: Modified `game_live.html.heex` to remove `phx-click="select_card"` handlers
- **Auto-detection logic**: Added `complete_card_challenge_auto/3` in `world.ex` for automatic card matching
- **Priority command parsing**: Enhanced `movement_handlers.ex` to detect card challenges before movement commands

### Multi-Language Voice Detection ✅
**Problem**: French phrases like "la pomme est verte" triggered movement ("est" = "east") instead of card validation.
**Solution**: Implemented language-specific detection patterns with priority system.

**Technical Implementation**:
```elixir
# In movement_handlers.ex:parse_voice_command/2
defp is_potential_card_sentence?(command, learning_language) do
  case learning_language do
    "fr" -> String.contains?(command, "est") or String.starts_with?(command, "j'aime") or 
            String.starts_with?(command, "cette") or String.contains?(command, "saute") or
            String.contains?(command, "se balance") or String.contains?(command, "arbres")
    "es" -> String.contains?(command, "es") or String.starts_with?(command, "me gusta")
    "zh" -> String.contains?(command, "是") or String.contains?(command, "很") 
    # ... patterns for all 9 languages
  end
end
```

### Unicode Character Preservation ✅
**Problem**: Accented characters (é, è, ê, î, ç) were stripped from voice commands, breaking card matching.
**Solution**: Updated regex patterns to preserve international characters.

**Fix Applied**:
```elixir
# Before: ~r/[^\w\s]/  (stripped accented characters)
# After: ~r/[.!?,:;]/   (preserves Unicode letters)
clean_command = voice_command
|> String.downcase()
|> String.trim()
|> String.replace(~r/[.!?,:;]/, "")  # Only remove basic punctuation
```

### Adaptive Card-Object Matching ✅
**Problem**: Mismatched number of cards vs objects, making some games uncompletable.
**Solution**: Dynamic card generation system that creates exactly one card per object present.

**Implementation**:
- **Dynamic deck generation**: `card.ex:generate_deck/3` now creates one card per emoji in world
- **Content structure fix**: Updated `content.vocabulary` access pattern (was `content.tutorial`)
- **Missing objects fix**: Added missing game objects to content modules for complete coverage
- **Template matching**: Improved card template selection for available objects

### French Language-Specific Improvements ✅
**Problem**: French cards weren't being detected properly due to language complexity.
**Solution**: Enhanced French pattern detection and content expansion.

**Specific Fixes**:
- **Apostrophe handling**: Added support for French contractions ("l'herbe", "l'œuf")
- **Gender/number variations**: Handles "verte/vertes", "rouge/rouges" variations
- **Extended French content**: Added complete French card templates for all fruit items
- **Speech recognition errors**: Added patterns for common speech-to-text mistakes ("7 carottes" -> "cette carotte")

### Language-Restricted Movement Commands ✅ (Latest Update)
**Problem**: Players could use English movement commands ("two times down") regardless of learning language.
**Solution**: Complete language restriction system - commands only work in the selected learning language.

**Key Improvements**:
- **English Pattern Removal**: Eliminated all English movement/card patterns when learning other languages
- **Language-Specific Parsing**: Commands parsed only in current learning language
  ```elixir
  # Before: English commands worked in any learning language
  String.match?(command, ~r/^\s*(2|two)\s+(south|down)\s*$/) -> {:move, :south, 2}
  
  # After: Only learning language commands work
  case learning_language do
    "fr" -> parse_french_numbered_movement(command)   # Only French patterns
    "ru" -> parse_russian_numbered_movement(command)  # Only Russian patterns
    "it" -> parse_italian_numbered_movement(command)  # Only Italian patterns
    _ -> :unknown  # No cross-language commands allowed
  end
  ```
- **Complete Multi-Language Movement Support**: All 9 languages now support full numbered movement patterns
  - **Pattern Examples**: "три север" (Russian), "3 giù" (Italian), "trois bas" (French), "三北" (Japanese)
- **Help & Look Commands**: Restricted to learning language ("aide" in French, "aiuto" in Italian, "помощь" in Russian)
- **Card Challenge Detection**: Language-specific sentence pattern recognition only

**Files Modified**:
- `lib/boba_talkie_web/live/game_livemodules/movement_handlers.ex` - Complete language restriction implementation
- `lib/boba_talkie/game/world.ex` - Fixed card loading to use ContentManager instead of hardcoded English templates
- `lib/boba_talkie/content_managermodules/card_description_translations.ex` - Added missing templates for Russian/Italian
- Movement parsers for all 9 languages with numbered patterns (1-3 steps)
- Language-specific command detection functions for authentic immersion
- `lib/boba_talkie_web/live/game_live.ex`: Removed manual card selection handlers
- `lib/boba_talkie_web/live/game_live.html.heex`: Removed card click interfaces
- `lib/boba_talkie_web/live/game_livemodules/movement_handlers.ex`: Added priority detection and language patterns
- `lib/boba_talkie/content_managermodules/fruits_content.ex`: Expanded French content and fixed missing objects
