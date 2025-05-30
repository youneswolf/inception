#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/db_password)
ADMIN_PASSWORD=$(cat /run/secrets/credentials)
user2=$(cat /run/secrets/pass_user2)


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar >/dev/null 2>&1
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
cd /var/www/wordpress

wp core download --allow-root

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

wp config set DB_NAME ${name_db} --allow-root
wp config set DB_USER ${wp_user} --allow-root
wp config set DB_PASSWORD ${DB_PASSWORD} --allow-root
wp config set DB_HOST ${host} --allow-root
wp config set DB_PREFIX ${prefix} --allow-root

wp core install --url=${url} --title=${title} --admin_user=${admin_user} --admin_password=${ADMIN_PASSWORD} --admin_email=${email} --allow-root

mkdir -p /run/php
chown -R www-data:www-data /var/www/wordpress
wp user create ${user22} ${user22_email} --role=editor --user_pass=${user2} --allow-root
wp db check --allow-root

exec /usr/sbin/php-fpm7.4 -F
