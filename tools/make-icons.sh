#!/bin/zsh
# Makes the site's icon files from one square PNG of the app icon.
# Uses only sips, which comes with macOS.
#
#   tools/make-icons.sh                      # uses assets/icon-1024.png
#   tools/make-icons.sh path/to/icon.png     # any square PNG
#
# Writes:
#   apple-touch-icon.png        180 x 180  (iOS home screen; also requested at the site root by default)
#   assets/img/icon-32.png       32 x 32   (browser tab)
#   assets/img/icon-120.png     120 x 120  (header logo, shown at 40 px)
#   assets/img/icon-512.png     512 x 512  (larger uses, e.g. sharing cards)
set -euo pipefail

cd "$(dirname "$0")/.."
src="${1:-assets/icon-1024.png}"

if [[ ! -f "$src" ]]; then
  echo "No icon at $src. Export a 1024 x 1024 PNG from Icon Composer to assets/icon-1024.png." >&2
  exit 1
fi

make() { sips -s format png -z "$1" "$1" "$src" --out "$2" >/dev/null; echo "wrote $2 ($1 px)"; }

make 180 apple-touch-icon.png
make 32  assets/img/icon-32.png
make 120 assets/img/icon-120.png
make 512 assets/img/icon-512.png
