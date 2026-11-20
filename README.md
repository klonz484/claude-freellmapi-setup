# Claude Code + FreeLLMAPI Setup

Run **Claude Code** against free models (Gemini, DeepSeek, Qwen, Groq, etc.) with high monthly token limits via [FreeLLMAPI](https://github.com/tashfeenahmed/freellmapi).

FreeLLMAPI aggregates free tiers from 80+ providers behind one OpenAI-compatible **and Anthropic-compatible** endpoint. Claude Code talks to it using the Anthropic Messages format.

> Personal use / experimentation only. Respect each provider's terms of service.

---

## Connect Claude Code (Quick Path)

### 1. Start FreeLLMAPI

- **Desktop app (easiest)**: Download from https://github.com/tashfeenahmed/freellmapi/releases  
  Dashboard usually runs on `http://127.0.0.1:31415`
- **Docker one-liner**:
  ```bash
  curl -fsSL https://freellmapi.co/install.sh | bash
  ```
  (usually `http://localhost:3001`)

Open the dashboard → **Keys** page → add free keys (Google AI Studio, Groq, etc.) → copy the unified key that starts with `freellmapi-`.

### 2. Connect Claude

**Fastest (recommended):**
```bash
export FREELLMAPI_API_KEY=freellmapi-YOUR_KEY_HERE
npx freellmapi launch
```

**Or permanent config:**
```bash
npx freellmapi setup-claude --url http://localhost:3001 --api-key freellmapi-YOUR_KEY_HERE
# Desktop app users:
# npx freellmapi setup-claude --url http://127.0.0.1:31415 --api-key freellmapi-YOUR_KEY_HERE
```

**Or use the helper scripts in this repo:**
```bash
export FREELLMAPI_API_KEY=freellmapi-YOUR_KEY_HERE
./launch-claude.sh          # temporary session
# or
./setup-claude.sh           # permanent config
```

### 3. Run
```bash
claude
```

You should now see Claude Code using free models with automatic failover.

See the `claude-config/` folder for more detailed connection options and an example `.env`.

---

## Files in this repo

| File / Folder | Purpose |
|---------------|---------|
| `README.md` | This guide |
| `claude-config/` | Example env + connection instructions |
| `setup-claude.sh` | Permanent Claude Code configuration |
| `launch-claude.sh` | Launch with credentials injected (nothing written to disk) |
| `.env.example` | FreeLLMAPI server environment template |

---

## Optional: Context handoff

Add to FreeLLMAPI environment:
```bash
FREELLMAPI_CONTEXT_HANDOFF=on_model_switch
```
This gives the next model a short note about what you were doing when a switch occurs.

---

## Requirements

- Node.js ≥ 20.18
- Running FreeLLMAPI instance
- Free provider API keys
- Claude Code installed (`claude --version` works)

---

## Links

- FreeLLMAPI: https://github.com/tashfeenahmed/freellmapi
- Live catalog: https://freellmapi.co
- Agent docs: https://github.com/tashfeenahmed/freellmapi/blob/main/docs/en/clients/01-agent-clients.md

---

## Disclaimer

This is a convenience setup repository. FreeLLMAPI is maintained by [tashfeenahmed](https://github.com/tashfeenahmed). Always check the official docs for the latest changes. Use free tiers responsibly.
