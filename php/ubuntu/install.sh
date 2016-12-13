#!/bin/bash

PHP_INI=/etc/php5/fpm/php.ini
PHP_FPM=/etc/php5/fpm/php-fpm.conf
WWW_CONF=/etc/php5/fpm/pool.d/www.conf

#export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y php5-fpm php5-mysql php5-gd libssh2-php
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#sed -i 's|^[; ]*\(expose_php = \).*|\1On|' $PHP_INI
#sed -i 's|^[; ]*\(post_max_size = \).*|\116G|' $PHP_INI
#sed -i 's|^[; ]*\(upload_max_filesize = \).*|\116G|' $PHP_INI
#
#sed -i 's|^[; ]*\(pid = \).*|\1/var/run/php5-fpm.pid|' $PHP_FPM
#sed -i 's|^[; ]*\(daemonize = \).*|\1no|' $PHP_FPM
#
#sed -i 's|^[; ]*\(listen = \).*|\10.0.0.0:9000|' $WWW_CONF
#sed -i 's|^[; ]*\(env\[.*\)|\1|' $WWW_CONF
#sed -i 's|^[; ]*\(env\[PATH\] = \)|\1'"$PATH"'|' $WWW_CONF
#
usermod -u 1001 www-data
groupmod -g 1001 www-data
