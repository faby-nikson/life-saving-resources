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


:house: [Back to home](README.md)