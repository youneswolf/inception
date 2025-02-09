#!/bin/bash

#change the line in the config to all inerfaces  (for ngnix)

wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

chown -R root:root /var/www/wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname=wordpress --dbuser=wp_user --dbpass=password --dbhost=localhost --dbprefix=wp_ --allow-root

wp core install --url=localhost --title=Title --admin_user=wp_user --admin_password=password --admin_email=test@email.com --allow-root

php7.4-fpm -F