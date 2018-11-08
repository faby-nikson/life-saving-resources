<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Bash / Shell](#bash--shell)
  - [Make your bash script](#make-your-bash-script)
    - [Structure](#structure)
    - [Tips](#tips)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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


Siege manual:
https://www.joedog.org/siege-manual/