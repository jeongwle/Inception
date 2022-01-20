FROM	debian:buster

RUN		apt-get update \
		&& apt-get -y upgrade \
		&& apt-get -y install \
		php7.3 \
		php-fpm \
		php-cli \
		php-mysql \
		php-mbstring \
		php-xml \
		dumb-init \
		&& rm -rf /var/lib/apt/lists/*

COPY	conf/wp-config.php /var/www/html/
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY	tools/latest.tar.gz /
COPY	tools/run.sh /
ARG		ARG_MYSQL_USER
ARG		ARG_MYSQL_PASSWORD
ARG		ARG_MYSQL_DATABASE
RUN		tar -xvf /latest.tar.gz \
		&& mv /wordpress/* /var/www/html \
		&& chown -R www-data:www-data /var/www/html \
		&& rm -r /wordpress /latest.tar.gz \
		&& sh run.sh

ENTRYPOINT	["usr/bin/dumb-init"]

CMD		["/usr/sbin/php-fpm7.3", "-F"]
