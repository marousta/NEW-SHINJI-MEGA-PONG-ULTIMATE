############################
FROM ubuntu:20.04 AS default

ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC

RUN apt-get update \
	&& apt-get upgrade -y

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

RUN apt-get install -y openssh-client qrencode ffmpeg
RUN ssh-keygen -t rsa -m PEM -b 4096 -Z chacha20-poly1305@openssh.com -f /etc/ssl/jwt.pem -q -N ""
RUN openssl rsa -in /etc/ssl/jwt.pem -pubout -out /etc/ssl/jwt.pem.pub

EXPOSE 3000

############################
FROM yarn AS frontend

RUN apt-get install -y openssl nginx
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=localhost" \
	-keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

EXPOSE 443
EXPOSE 5000
