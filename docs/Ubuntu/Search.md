<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Search](#search)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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