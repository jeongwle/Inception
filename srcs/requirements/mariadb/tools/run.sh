#!/bin/bash

sudo touch /var/run/mysqld/mysqld.sock
chmod -R 777 /var/lib/mysql/
chmod -R 777 /var/run/mysqld/
chmod -R 777 /var/log/mysql/
chown -R mysql:mysql /var/lib/mysql/
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root --skip-password
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root --skip-password
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysqld_safe
