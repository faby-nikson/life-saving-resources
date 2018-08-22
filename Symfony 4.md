Symfony 4
======

Tooltips
------

### ACL
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

### Doctrine

```
bin/console doctrine:schema:update --dump-sql
bin/console doctrine:schema:update --force
```

### Bundle development

Load a bundle in your project and replace the vendor folder with a symbolic link to your bundle project.
```

```

:house: [Back to home](README.md)