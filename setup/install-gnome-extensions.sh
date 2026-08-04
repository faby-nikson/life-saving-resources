#!/usr/bin/env bash
set -euo pipefail

# This script's own directory, so it works whatever the current working directory
SETUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${SETUP_DIR}/config/gnome-shell-extensions"
TARGET_DIR="${HOME}/.local/share/gnome-shell/extensions"

# Color text
printInColor() {
  local inputColor=$1
  local textToDisplay="$2"
  case $inputColor in
  red) color=$(tput setaf 1) ;;
  green) color=$(tput setaf 2) ;;
  yellow) color=$(tput setaf 3) ;;
  blue) color=$(tput setaf 4) ;;
  esac
  local reset=$(tput sgr0)
  echo ""${color}${textToDisplay}${reset}""
}

# Add a uuid to org.gnome.shell enabled-extensions, keeping whatever is already there.
# `gnome-extensions enable` is not usable here: it goes through the running shell, which
# refuses uuids it has not loaded yet - exactly the case on a fresh install.
enableExtension() {
  python3 - "$1" <<'PYTHON'
import ast, subprocess, sys

uuid = sys.argv[1]
current = subprocess.check_output(
    ['gsettings', 'get', 'org.gnome.shell', 'enabled-extensions'], text=True).strip()
enabled = [] if current in ('@as []', '[]') else ast.literal_eval(current)

if uuid in enabled:
    print('already-enabled')
else:
    enabled.append(uuid)
    subprocess.check_call(
        ['gsettings', 'set', 'org.gnome.shell', 'enabled-extensions', str(enabled)])
    print('enabled')
PYTHON
}

if [ ! -d "$SOURCE_DIR" ]; then
  printInColor red "No extension to install: ${SOURCE_DIR} not found"
  exit 1
fi

mkdir -p "$TARGET_DIR"
installed=0

for source in "$SOURCE_DIR"/*@*; do
  [ -d "$source" ] || continue
  uuid="$(basename "$source")"
  target="${TARGET_DIR}/${uuid}"

  printInColor blue "> ${uuid}"

  # Symlink rather than copy, so `git pull` is enough to update the extension.
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    printInColor red "  ${target} is a real directory, not a link: left untouched"
    printInColor yellow "  Remove it by hand, then run this script again"
    continue
  fi
  ln -sfn "$source" "$target"
  printInColor green "  linked to ${source}"

  # GSettings schemas have to be compiled next to the extension. The symlink means
  # this writes into the repo, which is why gschemas.compiled is git-ignored.
  if [ -d "${source}/schemas" ]; then
    glib-compile-schemas "${source}/schemas"
    printInColor green "  schemas compiled"
  fi

  case "$(enableExtension "$uuid")" in
  enabled) printInColor green "  added to enabled-extensions" ;;
  already-enabled) printInColor green "  already in enabled-extensions" ;;
  esac

  installed=$((installed + 1))
done

if [ "$installed" -gt 0 ]; then
  printInColor yellow "/!\\ Log out and back in: Wayland does not load a newly added extension on the fly"
fi
