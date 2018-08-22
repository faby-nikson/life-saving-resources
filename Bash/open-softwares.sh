#!/bin/bash

# ----------
# @author: f-dumas
# Description: Open several softwares on multiple desktpos
# Command: ./execute-multiple-curl.sh my-url-to-cal.com
# ----------

# Open this 1st desktop
wmctrl -s 0 
(google-chrome &) | (franz &) | ( /opt/Station/browserX-1.23.0-x86_64.AppImage &)
# Add sleeping time to wait for the softwares opening.
sleep 1

# Then, Open the 2nd desktop
wmctrl -1s 1
(phpstorm &)
