FROM	debian:buster

RUN		apt-get update && apt-get -y upgrade && apt-get -y install \
		php7.3 \
		php-fpm \
		php-cli \
		wget \
		curl \
		php-mysql \
		php-mbstring \
		php-xml \
		sendmail

COPY	conf/wp-config.php /var/www/html/
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY	tools/latest.tar.gz /
RUN		tar -xvf /latest.tar.gz
RUN		mv /wordpress/* /var/www/html/
RUN		chown -R www-data:www-data /var/www/html
RUN		rm -r /wordpress /latest.tar.gz
RUN		service php7.3-fpm start

ENTRYPOINT	["/usr/sbin/php-fpm7.3", "-F"]
