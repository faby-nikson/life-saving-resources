#!/usr/bin/env bash

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

printInColor blue "> Install requirements dependencies"
sudo apt install "wget"
sudo apt install "composer"
sudo apt install "php7.4-fpm"
sudo apt install "php8.1-fpm"
sudo apt install "nginx"
sudo apt install "curl"
sudo apt install "zsh"
sudo apt install "ffmpeg"
sudo apt install "node"

printInColor blue "> Use Zsh by default ###### answer: /bin/zsh #####"
chsh

printInColor blue "> Install terminal"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printInColor yellow "/!\ Relog your session in order to take into account modifications"

exit
