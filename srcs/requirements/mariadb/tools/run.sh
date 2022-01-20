#!/bin/bash

sudo chmod -R 777 /var/lib/mysql/
sudo chown -R mysql:mysql /var/lib/mysql/
service mysql start
sudo chmod -R 777 /var/run/mysqld/
sudo chmod -R 777 /var/log/mysql/
sudo chmod -R 644 /var/run/mysqld/mysqld.sock
sed -i -e "s|MYSQL_DATABASE|$ARG_MYSQL_DATABASE|g" ./mariadb.sql
sed -i -e "s|MYSQL_USER|$ARG_MYSQL_USER|g" ./mariadb.sql
sed -i -e "s|MYSQL_PASSWORD|$ARG_MYSQL_PASSWORD|g" ./mariadb.sql
mysql -u root -p$ARG_MYSQL_PASSWORD < mariadb.sql
mysql -u root -p$ARG_MYSQL_PASSWORD < wordpress.sql
ps -e | grep mysqld | awk '{print $1}' > a
kill -kill `cat a`
sleep 1
