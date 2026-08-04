# Stale docs

Docs dont le **sujet** ne sert plus. Gardées au cas où, mais on ne les met plus à jour et on ne compte
pas sur leur exactitude.

- [PhpStorm](./phpstorm.md) — live templates ; les réglages eux-mêmes sont versionnés dans
  [`setup/config/phpstorm/`](../../setup/config/phpstorm)
- [Windows Batch](./windows-batch) — plus de machine Windows, avec ses
  [scripts d'exemple](./windows-batch/examples)
- [`docker-drupal-example/`](./docker-drupal-example) — archi Apache + php-fpm pour un vieux projet
  Drupal. **Ne build plus** : Debian jessie/stretch, PHP 7.0, Drush 7, et il manque au moins
  `conf/fastcgi.conf`, `apache2-foreground`, `symfony.ini`, `symfony.pool.conf`, `build.sh`,
  `drupal.ini`. Les chemins internes ont en plus été corrompus par un renommage en masse
  (`docker-examples-compose`, `../windows-scripts-examples/docker-examples/containers/...`).
  Gardé comme référence de structure, pas comme point de départ.

Quand une doc redevient utile : la remonter dans [`docs/`](..) et la relire de bout en bout. Le fait
d'être dans ce dossier est le seul signal « périmé » du repo — pas de bandeau à coller dans les fichiers.
