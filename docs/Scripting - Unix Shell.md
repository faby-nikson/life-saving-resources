# Unix Shell / bash


> :warning: Not up to date


How to develop local scripts with ubuntu.

## How to execute scripts

First of all, you need to add the right to be executed on your machine:
```
chmod +x the-script.sh
```

You could want to create aliases in your `.bashrc` file:
```
alias="/the-path-to-the-repo/the-script.sh -with option"
```

Or add a symlink in your `bin` folder:

```
cd ~/bin
ln -s /the-path-to-the-repo/the-script.sh my-file.sh
chmod +x my-file.sh 
```

## Make your own bash script

Check those external documentations to go further:
- [https://www.tutorialspoint.com/unix/unix-basic-operators.htm](https://www.tutorialspoint.com/unix/unix-basic-operators.htm)
- [https://unixutils.com/string-manipulation-with-bash/](https://unixutils.com/string-manipulation-with-bash/)

> Check [JQ behaviour](https://blog.madrzejewski.com/jq-traiter-parser-json-shell-cli/)

### Structure

Begin your file with
```
#!/bin/bash
```

Execute the file:
```
chmod +x my-script.sh
```

### Tips

Get current directory :

```bash
dir="$1"
# No directory has been provided, use current
if [ -z "$dir" ]
then
    dir="`pwd`"
fi
```
Or with :

```bash
SOURCE_DIR=$(cd "$(dirname "$0")/.." && pwd)
```

## Useful shell script

### Helper file

```bash
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

```

Can be loaded by using:

```bash
SOURCE_DIR=$(cd "$(dirname "$0")/.." && pwd)
source "$SOURCE_DIR/scripts/_helper.sh"
```

### Stand alone script

```bash
#!/bin/bash
   # ----------
   # @author: f-dumas
   # Description: Script examples
   # Template version: 1.0
   # ----------
   # shellcheck disable=SC1090
   source "$(cd "$(dirname "$0")" && pwd)/../.helper_functions.sh"
   
   #########################
   # Help
   displayHelp() {
     # Command usage&
     printMessage info "-------------------
      Usage: $0 [-a] [-b] -c 'what1,what2,...INFINITY...'
   -------------------"
     # Options
     printMessage info "Parameters:
     -a    Display a lot of different 'Hello Worlds'
     -b    Does nothing
     -c    Does nothing
     -h    Display help
     -t    Test mode
     [...]"
     # Examples
     printMessage info "### Examples: ##
    - ./script_example.sh
    - ./script_example.sh -a
    - ./example_script.sh -b lol => /!\ le fichier lol n'existe pas
    - ./example_script.sh -b example_script.sh => le fichier example_script.sh existe
    "
     exit 2
   }
   
   checkFilename() {
     local varname=$1
     if [ -e "$varname" ]; then
       printMessage success "le fichier $varname existe"
     else
       printMessage error "le fichier $varname n'existe pas"
     fi
   }
   
   setVariable() {
     local varname=$1
     shift
     if [ -z "${!varname}" ]; then
       eval "$varname=\"$@\""
     else
       echo "Error: $varname already set"
       displayHelp
     fi
   }
   
   #########################
   # Main script starts here: get options
   
   # Get OPTIONS
   # - a does not need a value
   # - b and c requires a value (: after means that)
   # -  If nothing is found -> it goes to ?
   while getopts 'ab:c:?ht' option; do
     case $option in
     a) debugPrintMessage ;; # value is not used for this one
     b) checkFilename "$OPTARG" ;;
     c) setVariable VAR_1 "$OPTARG" ;;
     t) debugTest ;;
     h | ?) displayHelp ;; esac
   done
   
   exit
```

### Installer script

```bash
#!/usr/bin/env bash

SOURCE_DIR=$(cd "$(dirname "$0")/.." && pwd)

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

# Setup work aliases
printInColor blue "> Setup personal aliases"
ZSHFILE=~/.zshrc
LINE_TO_ADD="source ${SOURCE_DIR}/bash-aliases"
grep -qF -- "$LINE_TO_ADD" "$ZSHFILE" || (echo "$LINE_TO_ADD" >>"$ZSHFILE" && printInColor green "Done")
printInColor yellow "/!\ Run command to refresh aliases: 'source ~/.zshrc'"

# Clone personal useful projects
printInColor blue "> Git clone projects"
git clone git@github.m6web.fr:f-dumas/src-dev-env.git ~/Workspace/src-dev-env-backend
printInColor green "Done"
```

### Examples of how to handle parameters

```bash
#!/bin/sh
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"
echo $1 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $1 provided"

while read dir 
do
    [ -d "$dir" ] || die "Directory $dir does not exist"
    cd "$dir"
done <<EOF
~/myfolder1/$1/anotherfolder 
~/myfolder2/$1/yetanotherfolder 
~/myfolder3/$1/thisisafolder
EOF
```