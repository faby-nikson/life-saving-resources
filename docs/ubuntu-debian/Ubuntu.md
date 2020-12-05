# Ubuntu

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Setup the desktop](#setup-the-desktop)
  - [Useful softwares](#useful-softwares)
  - [Useful components and config](#useful-components-and-config)
  - [Misc](#misc)
- [Tips](#tips)
  - [ACL](#acl)
  - [Files & Folders](#files--folders)
  - [Remove](#remove)
  - [Archives & compression](#archives--compression)
  - [Stop firewall](#stop-firewall)
  - [Packages](#packages)
  - [Search](#search)
  - [Partitions](#partitions)
  - [Logs](#logs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Setup the desktop

### Useful softwares

- https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator

### Useful components and config

- Set the mouse focus: https://askubuntu.com/questions/978401/how-do-i-set-focus-follows-mouse-in-ubuntu-17-10
- Enable extended gesture: https://github.com/mpiannucci/gnome-shell-extended-gestures
- Keyboard mapping: `xev`

### Misc

- https://extensions.gnome.org/extension/1465/desktop-icons/
- Thème : Adwaita-Dark
- Icones : Default (Adwaita)

## Tips

### ACL

- Set rights: `setfacl -m u:$(whoami):rwX fichier`
- Set rights recursively: `sudo setfacl -R -m u:www-data:rwX -m u:$(whoami):rwX var`
- Set a default pattern: `sudo setfacl -dR -m u:www-data:rwX -m u:$(whoami):rwX var`
- Get rights: `getfacl fichier`

### Files & Folders
    
- Get current path: `pwd`
- Display files size in bytes / directories sorted by size: `du -sk * | sort -rn` (⚠️Careful on big folders)  
- List sub-repositories with their size: `du --si --max-depth=1` | `du -h --max-depth=1 | sort -hr`
- List directories with a size over X bytes: `du -sm * | awk '$1 > 1024'`
- Display files sorted by age (older first): `ls -lrt`

### Remove

- Recursive delete of Thumbs files in the current directory: `find . -type f -name "Thumbs.db" -exec rm -f {} \;`
- Remove all .svn folders in a project: `sudo find . -type d -name .svn -exec rm -rf {} \;`
- Recursive delete with Prompt of directories and files to remove: `rm -rfI cible_a_supprimer`

### Archives & compression

- Simple tar: `tar czfv votre_archive.tar.gz votre_dossier/`
- Extract: `tar zxvf votre_archive.tar.gz`
- Compress all files in a folder: `gzip *`

### Stop firewall

```
systemctl stop firewalld
firewall-cmd --state
```

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

### Search

- Find a file by its name: `find / -type f -name "xdebug.so"`
- Find files with a size over X Gygabytes: `find -size +1G -exec du -sh {} \;`
- Find files with a modified date older than 3 days: `find -mtime +3 -print`
- Find in files: `grep -R "php7.1-fpm.sock" /etc/nginx/*`

### Partitions

- Partitions size: `df -h`
- Partitions list: `vi /etc/fstab`

### Logs

- Display las error messages (-f means follow): `tail -f /var/log/messages` | `tail -f /var/log/*.log`
