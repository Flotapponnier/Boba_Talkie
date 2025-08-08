# Deepgram API Setup for BobaTalkie

Since Brave browser blocks Web Speech API for privacy reasons, you'll need to use Deepgram API for voice recognition.

## 🚀 Quick Setup

### 1. Get Deepgram API Key
1. Go to [Deepgram Console](https://console.deepgram.com/)
2. Sign up for free account (you get $200 credit)
3. Create a new project
4. Go to "API Keys" section
5. Create a new API key
6. Copy your API key

### 2. Configure Environment
1. Open the `.env` file in your project root
2. Replace `your_deepgram_api_key_here` with your actual API key:

```bash
# Replace this line:
DEEPGRAM_API_KEY=your_deepgram_api_key_here

# With your real key:
DEEPGRAM_API_KEY=abcd1234567890abcd1234567890abcd1234567890
```

### 3. Install Dependencies & Start
```bash
mix deps.get
mix phx.server
```

## 🎤 How It Works

### Voice Recognition Fallback Chain:
1. **Web Speech API** (Chrome/Safari) - ~50ms latency ⚡
2. **Deepgram API** (Brave/Privacy browsers) - ~200-400ms latency 🔒

### For Brave Users:
- Web Speech API is blocked by default
- App automatically falls back to Deepgram
- You'll see "Using MediaRecorder + Deepgram" in console
- Microphone permission still required

## 🔧 Troubleshooting

### Microphone Not Working in Brave:
1. Click the shield icon in address bar
2. Go to "Advanced controls"  
3. Allow "Use microphone"
4. Refresh the page
5. Try the microphone test again

### API Key Issues:
- Make sure `.env` file is in project root
- Check API key has no extra spaces/quotes
- Restart server after changing `.env`
- Check Deepgram console for usage/billing

### Audio Quality:
- Use headphones to prevent echo
- Speak clearly and loudly
- Try in a quiet environment
- Commands: "go up", "go down", "go left", "go right"

## 📊 Voice Commands Supported:
- `"go up"` / `"move up"` / `"north"`
- `"go down"` / `"move down"` / `"south"`  
- `"go left"` / `"move left"` / `"west"`
- `"go right"` / `"move right"` / `"east"`
- `"look around"` / `"help"`

## 💰 Deepgram Pricing:
- **Free tier**: $200 credit (~150 hours of audio)
- **Pay-as-you-go**: $0.0043 per minute
- Very affordable for prototyping!