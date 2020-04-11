# Bash / Shell

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

## Useful shell script

Have a look at a personal list of  
 [Useful unix shell scripts](https://github.com/f-dumas/shell-scripts) and help yourself!
