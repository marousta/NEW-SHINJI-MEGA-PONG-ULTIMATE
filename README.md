<p align="center">

<a  href="https://nestjs.com/"  target="blank"><img  src="https://nestjs.com/img/logo-small.svg"  width="50"  alt="Nest Logo"  /></a> <a  href="https://svelte.dev/"  target="blank"><img  src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Svelte_Logo.svg"  width="40"  alt="Nest Logo"  /></a> <a  href="https://www.typescriptlang.org/"  target="blank"><img  src="https://upload.wikimedia.org/wikipedia/commons/4/4c/Typescript_logo_2020.svg"  width="50"  alt="Nest Logo"  /></a> <a  href="https://www.postgresql.org/"  target="blank"><img  src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/1200px-Postgresql_elephant.svg.png"  width="50"  alt="Nest Logo"  /></a> <a  href="https://www.docker.com/"  target="blank"><img  src="https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png"  width="50"  alt="Nest Logo"  /></a>

</p>

# Description

Final project of the 42 cursus common core. More details [here](https://github.com/marousta/NEW-SHINJI-MEGA-PONG-ULTIMATE/blob/main/subject.pdf).

# Features

-   Super responsive.
-   Support chromium based browsers and firefox.
-   Support authentication from 42, Twitter, Discord and Emails. Frontend auto adapts. Every account are prompt to enter a password for recovery purposes.
-   Time based two-factor authentication.
-   User can have a chat with friends or strangers, change their profile picture (updated on all connected users in real time), block other users, play the game and more !
-   Chat with public and private channels and direct messages.
-   Channels have administators and moderators who can mute, kick, ban, promote, change name of the channel and it's profile picture.
-   You can play with your friends or play with other players in matchmaking (you can't match with a blocked user).
-   18 levels to climb with coherent XP scaling.
-   Application wide super user (wip) for moderation purposes.
-   Robust API with many validation processes and short response times.
-   Lightweight precompiled blazing fast frontend thanks to [Svelte](https://svelte.dev).
-   Supports multi tab.

# Running the app

Create and fill the .env file with the help of template.

```bash
# production mode
$ docker compose up --build

# development
$ docker compose -f docker-compose.dev.yml up --build

# run with ngrok

# sign up here https://ngrok.com/
# install ngrok
# register your server with the provided token
$ ngrok config add-authtoken <token>

# run ngrok
# https is for premium account only
$ ngrok http 80

# copy the provided url into DOMAIN in your .env file
$ docker compose -f docker-compose.ngrok.yml up --build
```

# Additional notes

You lost.
