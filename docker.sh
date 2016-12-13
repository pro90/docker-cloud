docker run -d --name myphp --privileged --link mysql -v /var/www:/var/www php5-fpm:debian
docker run -d --name mysql --privileged --volumes-from mysql_data -e "MYSQL_ROOT_PASSWORD=Holner2261" mysql
docker run -d --name mynginx --privileged -v /var/www/:/var/www -p 80:80 -p 443:443 --link myphp:phpfpm --volumes-from mynginx_data nginx:custom 
docker run -d --name mysamba --privileged -v /var/samba/downloads:/home/downloads -v /var/samba/public:/home/public -p 137:137 -p 138:138 -p 139:139 -p 445:445 samba:latest
