<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Packages](#packages)
    - [Packages](#packages-1)
      - [Ubuntu version](#ubuntu-version)
      - [List of available packages](#list-of-available-packages)
      - [Manually install a software](#manually-install-a-software)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Packages
======

### Packages

#### Ubuntu version
```
lsb_release -a
```

Other details:

```
cat /proc/version
```

#### List of available packages

```
sudo apt-get update
sudo apt-cache pkgnames | grep php7.1
```

#### Manually install a software

```
mv my_software /opt/
chmod a+x /opt/my_software
```

Add to main dashboard:
```
Go to ~/.local/share/applications 
and create your .desktop files there.
```

