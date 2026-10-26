# AI Podcast Generator

Generate complete multi-speaker podcast episodes from a single prompt.

**Pipeline:** Research & Script (Gemini) → Multi-speaker TTS (Sarvam Bulbul) → Audio Assembly (pydub)

## Features
- 🧠 AI-written dialogue scripts (natural, host-style banter)
- 🎙️ Multi-speaker TTS with distinct voices via Sarvam Bulbul v4
- 🎧 Stereo panning + inter-turn pauses for studio feel
- 🎵 Optional background music mixing with ducking
- 🔐 Secrets loaded from `.env` — never hardcoded or printed

## Setup

### 1. Install ffmpeg (required by pydub)
```bash
# macOS
brew install ffmpeg
# Ubuntu/Debian
sudo apt install ffmpeg
# Windows: download from https://ffmpeg.org/download.html and add to PATH
```

### 2. Install Python deps
```bash
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Configure secrets
```bash
cp .env.example .env
# Edit .env and add:
#   SARVAM_API_KEY=...
#   GEMINI_API_KEY=...
```

Get keys from:
- Sarvam: https://dashboard.sarvam.ai
- Google AI Studio: https://aistudio.google.com/app/apikey

### 4. Run
```bash
python podcast_generator.py "The Future of AI Agents" 3
```

Optional background music:
```bash
python podcast_generator.py "Topic" 5 music.mp3
```

Output: `episode.mp3` in the current directory.

## Security
- `.env` is gitignored and never committed.
- API keys are read once at startup via `python-dotenv`.
- Error messages reference variable **names**, never values.
- Rotate any key that has been exposed publicly.

## Voice Customization
Edit `PodcastGenerator.VOICE_MAP` in `podcast_generator.py` to swap in any
Sarvam Bulbul speaker IDs (e.g., `shubh_en_social`, `aparna_en_companion`).
See the Sarvam voice catalog for the full list.

## Multilingual
Change `language_code` in `_generate_audio_segment()` (e.g., `hi-IN`, `ta-IN`,
`bn-IN`) to produce non-English episodes. The script prompt is language-agnostic.