# Connecting Claude Code to FreeLLMAPI

This folder contains example configuration so Claude Code talks to your local FreeLLMAPI gateway instead of Anthropic's paid API.

## Method 1 – Recommended (no permanent files)

```bash
# Make sure FreeLLMAPI is running and you have the unified key
export FREELLMAPI_API_KEY=freellmapi-xxxxxxxx
npx freellmapi launch
```

This starts Claude Code with credentials injected for that session only.

## Method 2 – Permanent setup via CLI

```bash
npx freellmapi setup-claude --url http://localhost:3001 --api-key freellmapi-YOUR_KEY
```

(Use `http://127.0.0.1:31415` if you are using the FreeLLMAPI desktop app.)

## Method 3 – Manual environment variables

1. Copy `example.env` and fill in your key.
2. Source it:
   ```bash
   source claude-config/example.env
   ```
3. Run:
   ```bash
   claude
   ```

## Method 4 – Desktop FreeLLMAPI app

1. Open FreeLLMAPI desktop → tray icon → **Copy Claude URL** (or go to Keys → Anthropic tab).
2. In Claude Code / Claude Desktop settings set:
   - Gateway / Base URL = the copied URL (usually `http://127.0.0.1:31415`)
   - API Key = your `freellmapi-...` key

## Verify it works

```bash
claude --version
# Then start a session and ask something simple.
# Check FreeLLMAPI dashboard → request history to confirm traffic is flowing.
```

## Tips

- Free models have daily limits that usually reset at midnight UTC.
- The router will automatically fail over to the next available model when one is rate-limited.
- Add `FREELLMAPI_CONTEXT_HANDOFF=on_model_switch` to your FreeLLMAPI environment if you want a short context note when models switch mid-conversation.
