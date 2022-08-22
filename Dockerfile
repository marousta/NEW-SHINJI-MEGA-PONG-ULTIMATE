############################
FROM ubuntu:20.04 AS default

ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC

RUN apt-get update \
	&& apt-get upgrade -y

############################
FROM default AS postgresql

ARG password
ARG database

RUN apt-get install -y sudo postgresql
RUN echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf \
	&& echo "host    all             all             10.0.0.0/8             md5"  >> /etc/postgresql/12/main/pg_hba.conf \
	&& echo "host    all             all             172.0.0.0/8             md5"  >> /etc/postgresql/12/main/pg_hba.conf \
	&& echo "host    all             all             192.168.0.0/16             md5"  >> /etc/postgresql/12/main/pg_hba.conf
RUN service postgresql start \
	&& sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$password';" \
	&& sudo -u postgres psql -c "CREATE DATABASE $database;"

EXPOSE 5432

USER postgres

CMD /usr/lib/postgresql/12/bin/postgres -D "/var/lib/postgresql/12/main" -c "config_file=/etc/postgresql/12/main/postgresql.conf" >> /var/log/postgresql/service.log

############################
FROM default AS yarn

RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh \
	&& bash nodesource_setup.sh
RUN apt-get install -y nodejs
RUN npm install --location=global yarn
RUN mkdir -p /app

WORKDIR /app

############################
FROM yarn AS backend

RUN apt-get install -y openssh-client
RUN ssh-keygen -t rsa -m PEM -b 4096 -Z chacha20-poly1305@openssh.com -f /etc/ssl/jwt.pem -q -N ""

EXPOSE 3000

############################
FROM yarn AS nginx

RUN apt-get install -y openssl nginx
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=localhost" \
	-keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

EXPOSE 443
