#!/bin/bash

FILE_PATH="/etc/php/7.2/mods-available/xdebug.ini"

if [ `php -m|grep xdebug` ]
then
    # Xdebug is enabled
    sudo sed -i 's/^/#/' $FILE_PATH
    export XDEBUG_CONFIG="remote_enable=1"
    echo  "xdebug is now disabled."
    sudo service php7.2-fpm restart
    echo "php7.2-fpm restarted."
else
    # Xdebug is disabled
    sudo sed -i 's/^#//' $FILE_PATH
    export XDEBUG_CONFIG="remote_enable=0"
    echo "xdebug is now enabled"
    sudo service php7.2-fpm restart
    echo "php7.2-fpm restarted."
fi
