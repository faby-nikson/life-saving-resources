Ubuntu
====== 

Misc
------

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

#### Keyboard

Mapping:
```
xev
```


### Partitions

Partitions size:

`df -h`

Partitions list:

`vi /etc/fstab`

### Customization

* Thème : Arc-Darker
* Icones : Flat-remix


Files & Folders
------

### Folders

Current path:

`pwd`

Affichage du poids des fichiers en bytes / répertoires triés par poids
/!\ attention commande longue sur gros répertoire:

`du -sk * | sort -rn`

Liste des répertoires du dossier courant avec leur poids respectifs:

`du --si --max-depth=1`

`du -h --max-depth=1 | sort -hr`

Afficher les dossiers excédant 1G:

`du -sm * | awk '$1 > 1024'`

### Files

Find a file by its name:

`find / -type f -name "xdebug.so"`

Rechercher les fichiers avec une taille > X:

`find -size +1G -exec du -sh {} \;`

Rechercher fichiers dont date modif est de + de 3 jours:

`find -mtime +3 -print`

Affichage des fichiers du plus vieux au plus récent

`ls -lrt`

Find in files:

`grep -R "php7.1-fpm.sock" /etc/nginx/*`


### Suppression

Suppression récursive à partir du répertoire courant des fichiers Thumbs :

`find . -type f -name "Thumbs.db" -exec rm -f {} \;`

Supprimer les dossiers .svn d'un projet:

`sudo find . -type d -name .svn -exec rm -rf {} \;`

Suppression récursive avec Prompt (option I majuscule) des répertoires et fichiers :

`rm -rfI cible_a_supprimer`

### Archives

Compression:

`tar czfv votre_archive.tar.gz votre_dossier/`

Extraction:

`tar zxvf votre_archive.tar.gz`

Compresser automatiquement tous les fichiers d'un dossier:

`gzip *`


Logs
------

Affichage des messages d'erreur de log en temps réel (-f means follow): 

`tail -f /var/log/messages`

`tail -f /var/log/*.log`


Access / Rights
------

### Acl

Set rights:

`setfacl -m u:fabien:rwX fichier`

Recursively:

`sudo setfacl -R -m u:www-data:rwX -m u:f-dumas:rwX var`

Set a default pattern:

`sudo setfacl -dR -m u:www-data:rwX -m u:f-dumas:rwX var`

Get rights:

`getfacl fichier`



:house: [Back to home](README.md)