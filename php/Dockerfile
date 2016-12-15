FROM	debian:latest 
COPY 	install.sh /tmp/
RUN	["chmod","+x","/tmp/install.sh"]
RUN	["/tmp/install.sh"]
EXPOSE	9000
CMD	["php5-fpm", "-F"]
