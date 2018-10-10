PHP
======

Tool tips
------

## Good practise

In top of file:
```php
<?php declare(strict_types=1);
```

### Change php alias to handle different php versions

```bash
sudo update-alternatives --set php /usr/bin/php7.1
sudo update-alternatives --set php /usr/bin/php7.2
```

### Code review

* Phpstan : type review
* Cs-fixer : code style
* PHPQa: https://github.com/EdgedesignCZ/phpqa

### Code debug

* [Xdebug](Xdebug.md)
* PHPUnit

### Tests

* infection/infection: Code mutation to break tests 

Patterns
------

# ORM-less

https://matthiasnoback.nl/2018/03/ormless-a-memento-like-pattern-for-object-persistence/



:house: [Back to home](../../)