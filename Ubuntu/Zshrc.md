<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Zshrc](#zshrc)
  - [Alias functions](#alias-functions)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Zshrc
======

Alias functions
------

```bash
git-clean-br() {
  for br in $(git branch --merged | egrep -v '(^\*|master)'); do
    git branch -d ${br};
  done
  git fetch --prune
}

change-php-version() {
   ~/bin/change-php-version.sh "$1"
}

#Debug mode for phpunit
dphpunit() {
  XDEBUG_CONFIG="remote_enable=1" phpunit $1
}
```