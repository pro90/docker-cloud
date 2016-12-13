#!/bin/sh
docker run -d --name myphp -v /var/www/owncloud:/var/www/owncloud --link mysql:mysql php5-fpm:5.6.6
docker run -d --name mynginx -p 80:80 -p 443:443 -v /var/www/owncloud:/var/www/owncloud --link myphp:phpfpm nginx:latest

