#!/usr/bin/env bash
set -e
ROOT="$(dirname "$0")/.."
EN_FILE="$ROOT/apps/gateway/i18n/en.json"
if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required for i18n validation. Install jq in CI or locally."
  exit 0
fi

EN_KEYS=$(jq -r '.[].id' "$EN_FILE" | sort)
MISSING=0
for f in $ROOT/apps/gateway/i18n/*.json; do
  if [ "$f" = "$EN_FILE" ]; then
    continue
  fi
  KEYS=$(jq -r '.[].id' "$f" | sort)
  DIFF=$(comm -23 <(echo "$EN_KEYS") <(echo "$KEYS"))
  if [ -n "$DIFF" ]; then
    echo "Missing keys in $f:" >&2
    echo "$DIFF" >&2
    MISSING=1
  fi
done

if [ "$MISSING" -eq 1 ]; then
  echo "i18n validation failed: some locale files are missing keys." >&2
  exit 1
fi

echo "i18n validation passed: all locale files include en keys."
