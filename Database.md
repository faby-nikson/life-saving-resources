<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Database](#database)
  - [Cassandra](#cassandra)
    - [Install on Ubuntu 18](#install-on-ubuntu-18)
  - [Mysql](#mysql)
    - [Import/Exports](#importexports)
  - [Redis](#redis)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Database
======

Cassandra
------

### Install on Ubuntu 18

[datastax/php-driver/blob/master/ext/README.md](https://github.com/datastax/php-driver/blob/master/ext/README.md)

remove the libuv dev package (incompatible)

[installing-cassandra-with-php-7-on-ubuntu](https://www.jimwestergren.com/installing-cassandra-with-php-7-on-ubuntu)

add the right versions of packages libuv and cassandra : 
[pecl-install-cassandra-throws-error-unable-to-load-libcassandra](https://stackoverflow.com/questions/32997871/pecl-install-cassandra-throws-error-unable-to-load-libcassandra)

Autre version :
[cassandra/deploy-scalable-cassandra/](https://www.linode.com/docs/databases/cassandra/deploy-scalable-cassandra/)


Mysql
------

### Import/Exports

Import a SQL file:
```
mysql -u[username] -p [database_name] < file.sql
```



Redis
------

In memory (RAM) database


:house: [Back to home](../../)