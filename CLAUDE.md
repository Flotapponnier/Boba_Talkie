# BobaTalkie - Claude Development Context

## Claude Code Workflow
This project uses Claude Code with automatic CLAUDE.md loading:
- ✅ **Auto-context**: Claude Code automatically reads this file on startup
- ✅ **Real-time updates**: Changes to this file are immediately available
- ✅ **Multi-tool execution**: Can run multiple commands in parallel
- ✅ **Phoenix integration**: Understands Elixir/Phoenix toolchain
- 🔄 **Self-updating**: This file evolves with the codebase

## Current Status: VOICE-CONTROLLED GAME FUNCTIONAL ✅
**Phase 1 MVP Complete**: Full voice-controlled 2D grid navigation  
**Ready for Production**: Deepgram API integration for all browsers

## Project Summary
Voice-controlled language learning game built with Phoenix LiveView. Players speak commands to navigate a 2D grid world, learning pronunciation and vocabulary through immersive gameplay.

## Development Focus
**Phase 1 - Current Sprint**: Solo mode with 2D grid navigation
- ✅ Project setup and architecture
- 🔄 Index/landing page with voice setup  
- 🔄 2D grid map system (0s=walls, 1s=walkable)
- ⏳ Player movement via voice commands
- ⏳ Voice pipeline integration (<500ms target)

## Tech Stack
- **Backend**: Elixir/Phoenix with LiveView
- **Real-time**: Phoenix Channels over WebSockets
- **Voice**: Deepgram API for streaming ASR
- **Frontend**: LiveView + PWA capabilities
- **Deployment**: Fly.io

## Game Architecture (2D Grid System)

### Map Structure
```
Grid: 10x10 2D array
0 = wall/obstacle (black)
1 = walkable space (white/green)  
2 = player position (blue)
3 = interactive objects (yellow)

Example:
[1,1,1,0,0,0,1,1,1,1]
[1,2,1,0,3,0,1,1,1,1]  # 2=player, 3=item
[1,1,1,0,0,0,1,1,1,1]
```

### Code Architecture
```
lib/boba_talkie/
├── game/
│   ├── world.ex        # 2D grid state management
│   ├── player.ex       # Player position and actions  
│   ├── commands.ex     # Voice command parsing
│   └── map_loader.ex   # Load/generate grid maps
├── voice/
│   ├── recognizer.ex   # Deepgram integration
│   └── processor.ex    # Command validation
└── application.ex

lib/boba_talkie_web/
├── live/
│   ├── game_live.ex    # Main game LiveView
│   └── index_live.ex   # Landing page LiveView  
└── components/
    └── grid_component.ex # 2D grid renderer
```

### Voice Commands (Grid Navigation)
- "go north" → player.y -= 1
- "go south" → player.y += 1  
- "go east" → player.x += 1
- "go west" → player.x -= 1
- "look around" → describe surrounding cells

## Current Implementation Status
- ✅ Phoenix project with LiveView setup
- ✅ Folder structure and comprehensive documentation
- ✅ Index page with microphone test and game intro
- ✅ 2D grid world system (10x10 with walls, paths, items)
- ✅ Player movement logic with collision detection
- ✅ Game LiveView with real-time grid display
- ✅ Test controls for movement (arrow buttons)
- 🔄 Next: Voice capture integration
- ⏳ Pending: Deepgram ASR for voice recognition

## Ready to Test
Run `mix phx.server` and visit:
- http://localhost:4000 → Landing page with mic test
- http://localhost:4000/game → 2D grid game (use test buttons to move)

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

## Next Steps
1. Set up Deepgram integration for voice recognition
2. Create basic game engine structure
3. Implement voice command processing pipeline
4. Configure PWA for mobile-first experience
5. Set up development environment with testingyour_deepgram_api_key_here
