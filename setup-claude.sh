#!/usr/bin/env bash
# Quick helper to configure Claude Code against a local FreeLLMAPI instance

set -euo pipefail

URL="${FREELLMAPI_URL:-http://localhost:3001}"
KEY="${FREELLMAPI_API_KEY:-}"

if [[ -z "$KEY" ]]; then
  echo "Error: Set FREELLMAPI_API_KEY environment variable first."
  echo "Example:"
  echo "  export FREELLMAPI_API_KEY=freellmapi-xxxxxxxx"
  echo "  ./setup-claude.sh"
  exit 1
fi

echo "Configuring Claude Code → $URL"
npx freellmapi setup-claude --url "$URL" --api-key "$KEY"

echo ""
echo "Done. You can now run: claude"
