# Unix Shell

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [How to execute scripts](#how-to-execute-scripts)
- [Make your own bash script](#make-your-own-bash-script)
  - [Structure](#structure)
  - [Tips](#tips)
- [Useful shell script](#useful-shell-script)
- [Example scripts](#example-scripts)
  - [Stand alone script](#stand-alone-script)
  - [Installer script](#installer-script)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

```
dir="$1"
# No directory has been provided, use current
if [ -z "$dir" ]
then
    dir="`pwd`"
fi
```

## Useful shell script

Have a look at a personal list of  
 [Useful unix shell scripts](https://github.com/f-dumas/shell-scripts) and help yourself!

## Example scripts

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
     printMessage info "## Examples: ##
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

```
#!/bin/bash
# ----------
# @author: f-dumas
# Description: Setup example
# Template version: 1.0
# ----------
# shellcheck disable=SC1090
source "$(cd "$(dirname "$0")" && pwd)/../.helper_functions.sh"
#########################
# Help
displayHelp() {
  # Command usage&
  printMessage info "-------------------
   ###Setup example### Usage: $0 [-v] [-a 'my message']
-------------------"
  # Options
  printMessage info "Parameters:
  -a    Display the procedure to make an install file
  -t    Test mode
  "
  # Examples
  printMessage info "## Examples: ##
- $0 -v
- $0 -a 'hello world'
"
  exit 2
}

#########################
# Helper functions

actionToDoStuff() {
  addResult "$(printMessage info "Displaying your message '$MESSAGE' in different ways")"
  addResult "$(printMessage warning "Displaying your message '$MESSAGE' in different ways")"
  addResult "$(printMessage success "Displaying your message '$MESSAGE' in different ways")"
}

#########################
# Main script
#########################

# Handle command arguments
while getopts 'a?ht' option; do
  case $option in
  a)
    #Display commands
    set -x

    FILE_NAME=".the_file.sh"

    # Copy file
    res="$(cp ./$FILE_NAME ~/)"
    echo "$res"

    # Bash type
    FILE=$HOME/.zshrc

    # Add line in bash file
    LINE="source ~/$FILE_NAME"
    grep -qF -- "$LINE" "$FILE" || echo "$LINE" >>"$FILE"
    ;;
  t) debugTest ;;
  h | ?) displayHelp ;; esac
done

exit
```
