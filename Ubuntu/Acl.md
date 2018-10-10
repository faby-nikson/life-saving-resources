Acl
======

Set rights:

`setfacl -m u:$(whoami):rwX fichier`

Recursively:

`sudo setfacl -R -m u:www-data:rwX -m u:$(whoami):rwX var`

Set a default pattern:

`sudo setfacl -dR -m u:www-data:rwX -m u:$(whoami):rwX var`

Get rights:

`getfacl fichier`