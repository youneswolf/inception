#!/bin/bash

USER_PASSWORD=$(cat /run/secrets/db_password)
ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

service mariadb start

sleep 5

mysql -u root -e "CREATE DATABASE ${db};"

mysql -u root -e "CREATE USER '${db_user}';"

mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${db_user}'@'%' IDENTIFIED BY '${USER_PASSWORD}';"

mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';"

mysql -u root -p"${ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${ROOT_PASSWORD} shutdown

exec mysqld_safe --bind-address=0.0.0.0