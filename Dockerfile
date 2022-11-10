############################
FROM node:lts AS yarn

RUN apt update \
	&& apt-get install -y openssl

RUN mkdir -p /app

WORKDIR /app

############################
FROM yarn AS backend

RUN apt-get install -y openssh-client qrencode ffmpeg
RUN ssh-keygen -t rsa -m PEM -b 4096 -Z chacha20-poly1305@openssh.com -f /etc/ssl/jwt.pem -q -N "" \
	&& openssl rsa -in /etc/ssl/jwt.pem -pubout -out /etc/ssl/jwt.pem.pub

EXPOSE 3000

############################
FROM yarn AS frontend

RUN apt-get install -y nginx
RUN openssl ecparam -name secp384r1 -genkey -out /etc/nginx/cert.key \
	&& openssl req -x509 -out /etc/nginx/cert.crt -new -key /etc/nginx/cert.key -nodes -days 365 -subj '/C=FR/L=Lyon/O=42/OU=ft_transcendance/CN=localhost'
#-config config

EXPOSE 443
EXPOSE 5000
