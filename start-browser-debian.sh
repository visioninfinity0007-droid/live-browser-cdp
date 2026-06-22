#!/usr/bin/env bash
set -e

PROFILE_DIR="${CHROME_USER_DATA_DIR:-/data/chrome-profile}"
DEBUG_PORT="${CHROME_DEBUG_PORT:-9333}"
HOME_URL="${START_URL:-https://www.google.com}"

mkdir -p "$PROFILE_DIR"

exec chromium \
  --no-sandbox \
  --disable-dev-shm-usage \
  --remote-debugging-address=127.0.0.1 \
  --remote-debugging-port="$DEBUG_PORT" \
  --user-data-dir="$PROFILE_DIR" \
  --window-size=1366,768 \
  "$HOME_URL"
