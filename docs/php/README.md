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

* Xdebug
* PHPUnit

### Tests

* infection/infection: Code mutation to break tests 

Patterns
------

# ORM-less

https://matthiasnoback.nl/2018/03/ormless-a-memento-like-pattern-for-object-persistence/

### Use a specific version of PHP with PECL

```
pecl -d php_suffix=7.1 install <package>
``` 

:house: [Back to home](../../)
