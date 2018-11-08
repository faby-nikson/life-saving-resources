<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [PHP](#php)
  - [Tool tips](#tool-tips)
  - [Good practise](#good-practise)
    - [Change php alias to handle different php versions](#change-php-alias-to-handle-different-php-versions)
    - [Code review](#code-review)
    - [Code debug](#code-debug)
    - [Tests](#tests)
  - [Patterns](#patterns)
- [ORM-less](#orm-less)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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