#!/bin/bash
cat /etc/nginx/nginx.conf.template | \
	sed "s/__IMG_MAX_SIZE__/$IMG_MAX_SIZE/g" \
> /etc/nginx/nginx.conf
