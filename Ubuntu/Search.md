Search
======

Find a file by its name:

`find / -type f -name "xdebug.so"`

Rechercher les fichiers avec une taille > X:

`find -size +1G -exec du -sh {} \;`

Rechercher fichiers dont date modif est de + de 3 jours:

`find -mtime +3 -print`


Find in files:

`grep -R "php7.1-fpm.sock" /etc/nginx/*`