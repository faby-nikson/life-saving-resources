#!/bin/bash

die() {
  echo >&2 "$@"
  exit 1
}

[ "$#" -eq 1 ] || die "You must specify a phrase to get the matching link."

echo "$1"


cat "$HOME/Workspace/perso/life-saving-resources/README.md" | grep -i "$1"
