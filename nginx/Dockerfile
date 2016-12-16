FROM 	nginx:latest
ADD	nginx.conf /etc/nginx/
ADD	owncloud.conf /etc/nginx/sites-enabled/
ADD	wp_blog.conf /etc/nginx/sites-enabled/
ADD	wp_mvo.conf /etc/nginx/sites-enabled/
ADD	wp_ptm.conf /etc/nginx/sites-enabled/
RUN	["usermod","-u","33","www-data"]
RUN	["groupmod","-g","33","www-data"]
