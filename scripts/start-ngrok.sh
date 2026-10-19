#!/usr/bin/env bash

# ==============================================================================
# Ngrok Runner Script (Linux / macOS)
# ==============================================================================

ENDPOINT_NAME="my-switcher-endpoint"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# 1. Check if argument passed
if [ -n "$1" ]; then
    ENDPOINT_NAME="$1"
# 2. Check if .env exists and has NGROK_ENDPOINT_NAME
elif [ -f "$ROOT_DIR/.env" ]; then
    ENV_VAL=$(grep -E "^NGROK_ENDPOINT_NAME=" "$ROOT_DIR/.env" | cut -d '=' -f2 | tr -d '\r')
    if [ -n "$ENV_VAL" ]; then
        ENDPOINT_NAME="$ENV_VAL"
    fi
fi

echo "=============================================================================="
echo "Starting Ngrok endpoint: $ENDPOINT_NAME"
echo "=============================================================================="

if ! command -v ngrok &> /dev/null; then
    echo "[ERROR] 'ngrok' command could not be found in PATH."
    echo "Please install ngrok and ensure it is available in your PATH."
    exit 1
fi

ngrok start "$ENDPOINT_NAME"
