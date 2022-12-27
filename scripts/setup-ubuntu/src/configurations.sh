#!/usr/bin/env bash

SOURCE_DIR=$(pwd)

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
LINE_TO_ADD="source ${SOURCE_DIR}/bash-aliases"
grep -qF -- "$LINE_TO_ADD" "$ZSHFILE" || (echo "$LINE_TO_ADD" >>"$ZSHFILE" && printInColor green "Done")
printInColor yellow "/!\ Run command to refresh aliases: 'source ~/.zshrc'"

# Clone personal useful projects
printInColor blue "> Git clone personal projects"
mkdir ~/Workspace/perso
git clone git@github.com:f-dumas/git-helper-tool.git ~/Workspace/perso/git-helper-tool
git clone git@github.com:f-dumas/php-helper-tool.git ~/Workspace/perso/php-helper-tool
git clone git@github.com:f-dumas/life-saving-resources.git ~/Workspace/perso/life-saving-resources
printInColor green "Done"

# Install Emote
printInColor blue "> Setup Emote"
sudo snap install emote
printInColor green "Done"
