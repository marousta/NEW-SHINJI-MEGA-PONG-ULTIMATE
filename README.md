<p align="center">

<a  href="https://nestjs.com/"  target="blank"><img  src="https://nestjs.com/img/logo-small.svg"  width="50"  alt="Nest Logo"  /></a> <a  href="https://svelte.dev/"  target="blank"><img  src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Svelte_Logo.svg"  width="40"  alt="Nest Logo"  /></a> <a  href="https://www.typescriptlang.org/"  target="blank"><img  src="https://upload.wikimedia.org/wikipedia/commons/4/4c/Typescript_logo_2020.svg"  width="50"  alt="Nest Logo"  /></a> <a  href="https://www.postgresql.org/"  target="blank"><img  src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1200px-Postgresql_elephant.svg.png"  width="50"  alt="Nest Logo"  /></a> <a  href="https://www.docker.com/"  target="blank"><img  src="https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png"  width="50"  alt="Nest Logo"  /></a>

</p>

## Description

## Running the app

```bash
# production mode

$ docker compose up --build

# development

$ docker compose up -f docker-compose.dev.yml up --build

# run with ngrok

# sign up here https://ngrok.com/
# install ngrok
# register your server with the provided token
$ ngrok config add-authtoken <token>

# run ngrok
# https is for premium account only
$ ngrok http 80

# copy the provided url into DOMAIN in your .env file
$ docker compose up -f docker-compose.ngrok.yml up --build
```
