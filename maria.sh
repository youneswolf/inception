#!/bin/bash

service mariadb start 

sleep 5

mysql -u root -e "CREATE DATABASE wordpress;"

mysql -u root -e "CREATE USER 'wp_user';"

mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'password';"

mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"


mysql -u root -p"root" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -proot shutdown

exec mysqld_safe --bind-address=0.0.0.0
