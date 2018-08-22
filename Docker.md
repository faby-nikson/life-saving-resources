Docker
======


Install
------

First of all, you need to [install docker](https://www.docker.com/products/docker-engine)
 and [docker-compose](https://docs.docker.com/compose/) on your computer.
 
Commands
------ 

Run an image:
```
Docker run
```

List running containers:
```
docker ps
```

Retrouver l'ip d'une machine / d'un container
```
docker inspect [nom_du_container]
```

Stopper tous les processus
```
docker kill $(docker ps -q)
```

Rentrer dans le bash d'un container
```
docker exec -i -t [container_name] /bin/bash
docker exec -i -t [container_name] /bin/bash
``` 


Docker Compose
------

Build
```
docker-compose build
```

Lancement:
``` 
docker-compose up -d
```

Voir les containers qui tournent
```
docker-compose ps
``` 

Retrouver ip de docker
```
docker-machine ip
``` 

Examples
------

docker-compose.yml
```yaml
version: '2'

services:
    # Application
    application:
        image: c2is/application
        volumes:
            - ./:/var/www/drupal
        tty: true

    # Apache
    apache:
        build: docker/containers/apache
        environment:
            - WEBSITE_HOST=sepr.dev.acti
        ports:
            - "80:80"
            - "443:443"
        links:
            - php:php
        volumes_from:
            - application
        volumes:
            - ./docker/logs/apache/:/var/log/apache2

    # PHP
    php:
        build: docker/containers/php-fpm
        ports:
            - "9000:9000"
        environment:
            - GIT_USERNAME=XXXX
            - GIT_EMAIL=XXXX@acti.fr
            - SMTP_HOST=mail.eolas.fr
            - SMTP_USER=XXXX@acti.fr
            - SMTP_PASSWORD=XXXX
        volumes_from:
            - application
        volumes:
            - ~/.ssh:/root/.ssh
        working_dir: /var/www/drupal
```

docker/containers/apache/Dockerfile
```
FROM debian:jessie

RUN echo "deb http://ftp.es.debian.org/debian stable main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://ftp.es.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.debian.org/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -y install apache2 libapache2-mod-fastcgi && apt-get clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

ADD conf/fastcgi.conf /etc/apache2/mods-available/

RUN /bin/ln -sf ../mods-available/ssl.conf /etc/apache2/mods-enabled/
RUN /bin/ln -sf ../mods-available/ssl.load /etc/apache2/mods-enabled/

RUN /bin/ln -sf ../sites-available/default-ssl /etc/apache2/sites-enabled/001-default-ssl

RUN usermod -u 1000 www-data

EXPOSE 80
EXPOSE 443

RUN a2enmod proxy
RUN a2enmod actions
RUN a2enmod rewrite
RUN a2enmod socache_shmcb
RUN a2enmod proxy_fcgi
RUN a2enmod headers

RUN a2enmod ext_filter

COPY apache2-foreground /usr/local/bin/
RUN chmod +x /usr/local/bin/apache2-foreground

CMD ["apache2-foreground"]
```

docker/containers/apache/drupal.conf
```apacheconfig
<VirtualHost *:80>
    ServerName ${WEBSITE_HOST}
    DocumentRoot "/var/www/drupal"
    <Directory /var/www/drupal>
        Options +Indexes +FollowSymLinks +MultiViews
        Order allow,deny
        Allow from all
        AllowOverride All
        Require all granted
        DirectoryIndex index.php
    </Directory>
    RewriteEngine on
    RewriteRule ^/(.*\.php(/.*)?)$ fcgi://php:9000/var/www/drupal/$1 [L,P]
</VirtualHost>
<VirtualHost *:443>
    ServerName {WEBSITE_HOST}
    DocumentRoot "/var/www/drupal"
    SSLEngine On
    SSLCertificateFile      /var/www/ssl/ssl-certificate.crt
    SSLCertificateKeyFile   /var/www/ssl/ssl-key.key
    <Directory /var/www/drupal>
        Options +Indexes +FollowSymLinks +MultiViews
        Order allow,deny
        Allow from all
        AllowOverride All
        Require all granted
        DirectoryIndex index.php
    </Directory>
    RewriteEngine on
    RewriteRule ^/(.*\.php(/.*)?)$ fcgi://php:9000/var/www/drupal/$1 [L,P]
</VirtualHost>
```

docker/containers/php-fpm/Dockerfile
```
FROM debian:stretch

RUN mkdir /entrypoint-initdb.d

RUN apt-get update && apt-get install -y git zip mysql-client php7.0-common php7.0-cli php7.0-fpm php7.0-mcrypt php7.0-mysql php7.0-apcu php7.0-gd php7.0-imagick php7.0-curl php7.0-intl php7.0-pgsql php7.0-mbstring php-pear php7.0-dev php7.0-xdebug

RUN rm /etc/php/7.0/fpm/pool.d/*

ADD symfony.ini /etc/php/7.0/fpm/conf.d/
ADD symfony.ini /etc/php/7.0/cli/conf.d/
ADD symfony.pool.conf /etc/php/7.0/fpm/pool.d/

RUN usermod -u 1000 www-data

# Install composer
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN mkdir /var/composer
RUN composer require symfony/var-dumper --working-dir=/var/composer
RUN chown -R www-data:www-data /var/composer
RUN echo "auto_prepend_file = /var/composer/vendor/autoload.php" >> /etc/php/7.0/fpm/php.ini
RUN echo "auto_prepend_file = /var/composer/vendor/autoload.php" >> /etc/php/7.0/cli/php.ini

ADD build.sh /opt/docker/
RUN chmod +x /opt/docker/build.sh && sh /opt/docker/build.sh


VOLUME /var/www/.ssh

RUN service php7.0-fpm start

EXPOSE 9000

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/entrypoint.sh /entrypoint.sh && chmod +x /entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["php-fpm7.0", "-F"]

# Conf
ADD drupal.ini /etc/php5/fpm/conf.d/

# SMTP
RUN apt-get update
RUN apt-get install -y ssmtp
RUN apt-get install -y mysql-client

# Install Drush
RUN git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
RUN cd /usr/local/src/drush && \
    git checkout 7.x && \
    ln -s /usr/local/src/drush/drush /usr/bin/drush && \
    composer install

# Entry point
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Relaunch PHP
CMD ["php5-fpm", "-F"]
```

docker/containers/php-fpm/entrypoint.sh
```
#!/bin/bash
set -e

if [ -z "$SMTP_HOST" ]; then
	echo "No smtp host provided";
	exit 1;
fi

rm /etc/ssmtp/revaliases
rm /etc/ssmtp/ssmtp.conf
cat <<EOF >> /etc/ssmtp/revaliases
root:$SMTP_USER:$SMTP_HOST
EOF

cat <<EOF >> /etc/ssmtp/ssmtp.conf
root=postmaster
mailhub=$SMTP_HOST
AuthUser=$SMTP_USER
AuthPass=$SMTP_PASSWORD
FromLineOverride=YES
#Debug=YES
hostname=docker.acti
EOF

exec "$@"
```

docker/containers/php-fpm/drupal.ini ??
```apacheconfig
date.timezone="Europe/Paris"
upload_max_filesize = 40M
post_max_size = 40M
memory_limit = 2G
xdebug.max_nesting_level = 1000
```

docker/composer
```
#!/bin/bash
echo -e "Running command: docker-compose exec --user=www-data php php -d memory_limit=-1 /usr/local/bin/composer $@ --working-dir=/var/www/symfony"
echo -e "...............\n\n"

docker-compose exec --user=www-data php php -d memory_limit=-1 /usr/local/bin/composer $@ --working-dir=/var/www/symfony
echo ""
```

docker/drush
```
#!/bin/bash
echo -e "docker-compose exec --user=www-data php /usr/bin/drush $@ --root=/var/www/drupal"
echo -e "...............\n\n"

docker-compose exec --user=www-data php /usr/bin/drush $@ --root=/var/www/drupal
echo ""
```

docker/drush-up
```
#!/bin/bash
echo -e "docker-compose exec --user=www-data php /usr/local/bin/drush $@ --root=/var/www/drupal"
echo -e "...............\n\n"

docker-compose exec --user=www-data php /usr/bin/drush pm-update $@ --root=/var/www/drupal --no-backup
echo ""
```





:house: [Back to home](README.md)