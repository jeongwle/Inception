#!/bin/bash

sed -i -e "s|MYSQL_DATABASE|$ARG_MYSQL_DATABASE|g" /var/www/html/wp-config.php
sed -i -e "s|MYSQL_USER|$ARG_MYSQL_USER|g" /var/www/html/wp-config.php
sed -i -e "s|MYSQL_PASSWORD|$ARG_MYSQL_PASSWORD|g" /var/www/html/wp-config.php

service php7.3-fpm start
service php7.3-fpm stop
