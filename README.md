# Claude Code + FreeLLMAPI Setup

Run **Claude Code** against free models (Gemini, DeepSeek, Qwen, Groq, etc.) with high monthly token limits via [FreeLLMAPI](https://github.com/tashfeenahmed/freellmapi).

FreeLLMAPI aggregates free tiers from 80+ providers behind one OpenAI-compatible (and Anthropic-compatible) endpoint. Claude Code talks to it using the Anthropic Messages format.

> Personal use / experimentation only. Respect each provider's terms of service.

---

## Quick Start (Recommended)

### 1. Install FreeLLMAPI

**Option A – Desktop app (easiest)**  
Download the latest release for your OS from:  
https://github.com/tashfeenahmed/freellmapi/releases

**Option B – One-liner (Docker)**  
```bash
curl -fsSL https://freellmapi.co/install.sh | bash
```

**Option C – Docker Compose**  
```bash
mkdir -p ~/freellmapi && cd ~/freellmapi
ENCRYPTION_KEY="$(openssl rand -hex 32)"
printf "ENCRYPTION_KEY=%s\nPORT=3001\n" "$ENCRYPTION_KEY" > .env
# then use the official docker-compose from the FreeLLMAPI repo
```

After starting, open the dashboard (usually `http://localhost:3001` or the desktop tray app) and add free provider keys (Google AI Studio, Groq, etc.) on the **Keys** page.

Copy the unified key that looks like `freellmapi-...`.

### 2. Connect Claude Code

**Easiest (no config written to disk):**
```bash
npx freellmapi launch
```
This injects the credentials into the Claude Code process for that session only.

**Or set up permanently:**
```bash
# Replace with your actual unified key and URL
npx freellmapi setup-claude --url http://localhost:3001 --api-key freellmapi-YOUR_KEY_HERE
```

Desktop app users usually use port `31415`:
```bash
npx freellmapi setup-claude --url http://127.0.0.1:31415 --api-key freellmapi-YOUR_KEY_HERE
```

### 3. Run Claude Code
```bash
claude
```

You should now be able to use Claude Code powered by free models with automatic failover.

---

## Manual environment variables (alternative)

```bash
export ANTHROPIC_BASE_URL="http://localhost:3001"   # or http://127.0.0.1:31415 for desktop
export ANTHROPIC_AUTH_TOKEN="freellmapi-YOUR_KEY_HERE"
claude
```

---

## Optional: Context handoff on model switch

Add this to your FreeLLMAPI `.env` (or environment) so the next model receives a short summary when a switch happens:

```bash
FREELLMAPI_CONTEXT_HANDOFF=on_model_switch
```

---

## Useful commands

| Command | Purpose |
|---------|---------|
| `npx freellmapi launch` | Start Claude Code with credentials injected (no files written) |
| `npx freellmapi setup-claude --url ... --api-key ...` | Write Claude Code config |
| `npx freellmapi setup-claude --dry-run` | Preview the config changes |
| `npx freellmapi keys list` | List provider keys (needs dashboard token) |
| `npx freellmapi list` | Show supported agents |

---

## Requirements

- Node.js ≥ 20.18
- A running FreeLLMAPI instance (desktop, Docker, or self-hosted)
- Free API keys from providers (Google AI Studio, Groq, etc.)
- Claude Code installed (`claude --version` works)

---

## Links

- FreeLLMAPI repo: https://github.com/tashfeenahmed/freellmapi
- Live model catalog: https://freellmapi.co
- Clients & agents docs: https://github.com/tashfeenahmed/freellmapi/blob/main/docs/en/clients/01-agent-clients.md
- Supported agents: https://github.com/tashfeenahmed/freellmapi/blob/main/docs/en/clients/02-supported-agents.md

---

## Disclaimer

This is a convenience setup repository. FreeLLMAPI itself is maintained by [tashfeenahmed](https://github.com/tashfeenahmed). Always check the official docs for the latest changes. Use free tiers responsibly and only for personal experimentation.
