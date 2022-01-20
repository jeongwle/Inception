FROM	debian:buster

RUN		apt-get update \
		&& apt-get -y upgrade \
		&& apt-get -y install nginx openssl dumb-init \
		&& rm -rf /var/lib/apt/lists/*


COPY	conf/server_pkey.pem /etc/ssl/private/
COPY	conf/server.crt /etc/ssl/certs/
COPY	conf/default /etc/nginx/sites-available/

ENTRYPOINT	["/usr/bin/dumb-init"]

CMD		["nginx", "-g", "daemon off;"]
