#!/bin/bash

# ----------
# @author: f-dumas
# Description: This script will check if you have uncomited changes in your gits projects.
# ----------

# Define here the directories you want to check.
dir1="/home/f-dumas/Documents/*"
dir2="/home/f-dumas/wwwroot/*"
dirs=($dir1 $dir2)

# Loop on folders
for folders in ${dirs[@]}; do
    # Loop all sub-directories
    for f in $folders
    do
        # Only interested in directories
        [ -d "${f}" ] || continue
        # Check if directory is a git repository
        if [ -d "$f/.git" ]
        then
            mod=0
            cd $f
            # Check for modified files
            if [ $(git status | grep modified -c) -ne 0 -o $(git status | grep modifié -c) -ne 0  ]
            then
                mod=1
                echo -en "\033[0;32m"
                echo "(*) ${f}"
                echo -en "\033[0m"
            fi
            # Check for untracked files
            if [ $(git status | grep Untracked -c) -ne 0  -o  $(git status | grep "non suivis" -c) -ne 0 ]
            then
                mod=1
                echo -en "\033[0;31m"
                echo "(+) ${f}"
                echo -en "\033[0m"
            fi
            cd ../
        fi
    done
done


