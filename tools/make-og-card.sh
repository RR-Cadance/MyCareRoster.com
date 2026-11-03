#!/bin/zsh
# Renders tools/og-card.html to assets/img/og-card.png (1200 x 630) with headless Google Chrome.
# Run tools/make-icons.sh first so the icon is current.
set -euo pipefail

cd "$(dirname "$0")/.."
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
out="$PWD/assets/img/og-card.png"

"$chrome" --headless --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
  --window-size=1200,630 --allow-file-access-from-files \
  --screenshot="$out" "file://$PWD/tools/og-card.html" 2>/dev/null

sips -g pixelWidth -g pixelHeight "$out"
