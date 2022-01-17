#!/bin/bash

service mysql start
sudo chmod -R 777 /var/lib/mysql/
sudo chmod -R 777 /var/run/mysqld/
sudo chmod -R 777 /var/log/mysql/
sudo chown -R mysql:mysql /var/lib/mysql/
sudo chmod -R 644 /var/run/mysqld/mysqld.sock
sleep 1
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root --skip-password
sleep 1
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root --skip-password
sleep 1
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql -u root --skip-password
sleep 1
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
sleep 1
mysql -u root -p$MYSQL_DATABASE < wordpress.sql
sleep 1
service mysql stop
sleep 1

mysqld_safe
