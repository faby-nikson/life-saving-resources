#!/usr/bin/env bash

# This script's own directory, so it works whatever the current working directory
SETUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# Install starship
printInColor blue "> Install starship"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
printInColor green "Done"

# Setup personal aliases
printInColor blue "> Setup personal aliases"
ZSHFILE=~/.zshrc
LINE_TO_ADD="source ${SETUP_DIR}/config/zsh/aliases.zsh"
grep -qF -- "$LINE_TO_ADD" "$ZSHFILE" || (echo "$LINE_TO_ADD" >>"$ZSHFILE" && printInColor green "Done")
# The aliases file used to be named bash-aliases and lived elsewhere: warn about the leftover line
if grep -q "bash-aliases" "$ZSHFILE"; then
  printInColor red "/!\ Remove the obsolete 'source .../bash-aliases' line from ${ZSHFILE}"
fi
printInColor yellow "/!\ Run command to refresh aliases: 'source ~/.zshrc'"

# No personal project left to clone: git-helper-tool was replaced by bin/git-checker and
# bin/git-clean in this repository, and php-helper-tool no longer exists on GitHub.
# ~/Workspace/perso is created by hand, see the prerequisites in README.md.

# Install Emote
printInColor blue "> Setup Emote"
sudo snap install emote
printInColor green "Done"

# Install the Gnome Shell extensions kept in this repo
printInColor blue "> Setup Gnome Shell extensions"
"${SETUP_DIR}/install-gnome-extensions.sh"
printInColor green "Done"
