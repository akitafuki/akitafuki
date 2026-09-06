#!/usr/bin/env bash
set -e

# Change to script directory
cd "$(dirname "$0")"

CHROME_BIN=""
for cmd in google-chrome google-chrome-stable chromium chromium-browser; do
  if command -v "$cmd" >/dev/null 2>&1; then
    CHROME_BIN="$cmd"
    break
  fi
done

if [ -z "$CHROME_BIN" ]; then
  echo "❌ Error: Neither Google Chrome nor Chromium was found in PATH." >&2
  exit 1
fi

echo "📄 Compiling 1-page resume using $CHROME_BIN..."
"$CHROME_BIN" --headless=new --no-sandbox --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=Jimmie_Maggard_Resume.pdf file://"$(pwd)"/resume_1page.html

echo "📄 Compiling 2-page resume using $CHROME_BIN..."
"$CHROME_BIN" --headless=new --no-sandbox --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=Jimmie_Maggard_Resume_2Page.pdf file://"$(pwd)"/resume_2page.html

echo "✅ Successfully generated:"
echo "   - Jimmie_Maggard_Resume.pdf (1-page edition)"
echo "   - Jimmie_Maggard_Resume_2Page.pdf (2-page edition)"
