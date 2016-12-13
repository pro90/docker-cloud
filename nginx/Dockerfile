FROM 	nginx:latest
ADD	nginx.conf /etc/nginx/
ADD	owncloud.conf /etc/nginx/sites-enabled/
ADD	wordpress.conf /etc/nginx/sites-enabled/
ADD	pro.key /etc/ssl/nginx/
ADD	pro.crt /etc/ssl/nginx/
RUN	["usermod","-u","33","www-data"]
RUN	["groupmod","-g","33","www-data"]
