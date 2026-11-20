#!/usr/bin/env bash
# Launch Claude Code with FreeLLMAPI credentials injected (nothing written to disk)

set -euo pipefail

URL="${FREELLMAPI_URL:-http://localhost:3001}"
KEY="${FREELLMAPI_API_KEY:-}"

if [[ -z "$KEY" ]]; then
  echo "Error: Set FREELLMAPI_API_KEY first."
  echo "  export FREELLMAPI_API_KEY=freellmapi-xxxxxxxx"
  exit 1
fi

echo "Launching Claude Code via FreeLLMAPI at $URL ..."
npx freellmapi launch --url "$URL" --api-key "$KEY"
