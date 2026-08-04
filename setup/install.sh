#!/usr/bin/env bash
set -euo pipefail

# Color text
printInColor() {
  local inputColor=$1
  local textToDisplay="$2"
  local color="" reset=""
  case $inputColor in
  red) color=$(tput setaf 1) ;;
  green) color=$(tput setaf 2) ;;
  yellow) color=$(tput setaf 3) ;;
  blue) color=$(tput setaf 4) ;;
  esac
  reset=$(tput sgr0)
  echo "${color}${textToDisplay}${reset}"
}

# Unversioned meta-packages, so this keeps working across Ubuntu releases
PACKAGES=(
  composer
  curl
  ffmpeg
  nginx
  nodejs
  php-fpm
  wget
  zsh
)

printInColor blue "> Refresh package lists"
sudo apt update

printInColor blue "> Install requirements dependencies"
sudo apt install -y "${PACKAGES[@]}"
printInColor green "Done"

printInColor blue "> Use Zsh by default"
chsh -s "$(command -v zsh)"
printInColor green "Done"

printInColor blue "> Install terminal (oh-my-zsh)"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  printInColor green "Already installed, skipped"
else
  # --unattended: don't run zsh at the end, so this script can carry on
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  printInColor green "Done"
fi

printInColor yellow "/!\ Relog your session in order to take into account modifications"
