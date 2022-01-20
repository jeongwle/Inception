FROM	debian:buster

RUN		apt-get update \
		&& apt-get -y upgrade \
		&& apt-get -y install mariadb-server procps sudo dumb-init \
		&& mysql_install_db \
		&& rm -rf /var/lib/apt/lists/*

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/wordpress.sql .
COPY	./tools/mariadb.sql .
COPY	./tools/run.sh .
ARG		ARG_MYSQL_USER
ARG		ARG_MYSQL_DATABASE
ARG		ARG_MYSQL_PASSWORD
RUN		sh run.sh

ENTRYPOINT	["usr/bin/dumb-init"]

CMD		["mysqld_safe"]
