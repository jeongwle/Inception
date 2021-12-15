#!/bin/bash

service mysql start
echo "CREATE DATABASE IF NOT EXISTS '$MYSQL_DATABASE';" | mysql -u root --skip-password
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u -root --skip-password
echo "GRANT ALL ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'%';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysqld_safe --bind-address=0.0.0.0
