#!/bin/bash

# sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
cd /var/www/wordpress

wp core download --allow-root

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

wp config set DB_NAME wordpress --allow-root
wp config set DB_USER wp_user --allow-root
wp config set DB_PASSWORD password --allow-root
wp config set DB_HOST mariadb:3306 --allow-root
wp config set DB_PREFIX wp_ --allow-root

wp core install --url=localhost --title=Title --admin_user=wp_user --admin_password=password --admin_email=test@email.com --allow-root

mkdir -p /run/php
chown -R www-data:www-data /var/www/wordpress

wp db check --allow-root

/usr/sbin/php-fpm7.4 -F

