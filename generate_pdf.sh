#!/usr/bin/env bash
set -e

# Change to script directory
cd "$(dirname "$0")"

echo "📄 Compiling 1-page resume..."
google-chrome --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=Jimmie_Maggard_Resume.pdf file://"$(pwd)"/resume_1page.html

echo "📄 Compiling 2-page resume..."
google-chrome --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=Jimmie_Maggard_Resume_2Page.pdf file://"$(pwd)"/resume_2page.html

echo "✅ Successfully generated:"
echo "   - Jimmie_Maggard_Resume.pdf (1-page edition)"
echo "   - Jimmie_Maggard_Resume_2Page.pdf (2-page edition)"
