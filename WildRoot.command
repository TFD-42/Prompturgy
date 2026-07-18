#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"
source ".venv/bin/activate"
if ! curl -s "http://localhost:11434/api/tags" &>/dev/null; then
    open -a Ollama 2>/dev/null || ollama serve &>/dev/null &
    sleep 2
fi
python3 prompt_expert_enhance.py --web
