<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Acl](#acl)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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