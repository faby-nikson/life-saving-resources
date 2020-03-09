#!/bin/bash
source="vendor/$1"
destination="$2"

if [ -z "$source" ]; then
 echo "you need to provide a source value";
 exit;
fi

if [ -z "$destination" ]; then
 echo "you need to provide a destination value";
 exit;
fi

if [ -d "./vendor" ]
then
    echo "Removing the vendor folder: $source"
    rm -rf "$source"
    echo "Recreating symlink for: $destination"
    ln -s "$destination" "$source"
else
    echo "No vendor folder found. Nothing to excute."
fi