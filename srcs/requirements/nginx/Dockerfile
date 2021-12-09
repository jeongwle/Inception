FROM	debian:buster

RUN		apt-get update && apt-get -y upgrade && \
		apt-get -y install nginx openssl

COPY	conf/server_pkey.pem /etc/ssl/private/
COPY	conf/server.crt /etc/ssl/certs/
COPY	conf/default /etc/nginx/sites-available/

CMD		service nginx start
