Bash / Shell
======

Make your bash script
------

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
