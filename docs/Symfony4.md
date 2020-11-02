<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Symfony 4](#symfony-4)
  - [Tooltips](#tooltips)
    - [ACL](#acl)
    - [Cache clear](#cache-clear)
    - [Doctrine](#doctrine)
    - [Bundle development](#bundle-development)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Symfony 4
======

Tooltips
------

### ACL

```
sudo setfacl -dR -m u:www-data:rwX -m u:$(whoami):rwX var
sudo setfacl -R -m u:www-data:rwX -m u:$(whoami):rwX var
```

### Cache clear

```
bin/console c:c
bin/console cache:clear
bin/console cache:clear --env=prod --no-warmup
```

### Doctrine

```
bin/console doctrine:schema:update --dump-sql
bin/console doctrine:schema:update --force
```

### Bundle development

Load a bundle in your project and replace the vendor folder with a symbolic link to your bundle project.


:house: [Back to home](../../)