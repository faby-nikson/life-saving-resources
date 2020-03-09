#!/bin/bash

# ----------
# @author: f-dumas
# Description: Change php alias if there are multiple versions
# Command: ./change-php-version.sh 7.2
# ----------

version="$1"
sudo update-alternatives --set php /usr/bin/php$version
