#!/bin/bash

tar -xvf /latest.tar.gz
cp -r /wordpress/* /var/www/html/
chown -R www-data:www-data /var/www/html
rm -r /wordpress /latest.tar.gz

service php7.3-fpm start
bash
