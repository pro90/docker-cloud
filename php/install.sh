#!/bin/bash

PHP_INI=/etc/php5/fpm/php.ini
PHP_FPM=/etc/php5/fpm/php-fpm.conf
WWW_CONF=/etc/php5/fpm/pool.d/www.conf

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y cron bzip2 php5-cli php5-gd php5-pgsql php5-sqlite php5-mysqlnd php5-curl php5-intl php5-mcrypt php5-ldap php5-gmp php5-apcu php5-imagick php5-fpm libssh2-php smbclient nginx supervisor 
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

sed -i 's|^[; ]*\(expose_php = \).*|\1On|' $PHP_INI
sed -i 's|^[; ]*\(post_max_size = \).*|\116G|' $PHP_INI
sed -i 's|^[; ]*\(upload_max_filesize = \).*|\116G|' $PHP_INI

sed -i 's|^[; ]*\(pid = \).*|\1/var/run/php5-fpm.pid|' $PHP_FPM
sed -i 's|^[; ]*\(daemonize = \).*|\1no|' $PHP_FPM

sed -i 's|^[; ]*\(listen = \).*|\10.0.0.0:9000|' $WWW_CONF
sed -i 's|^[; ]*\(env\[.*\)|\1|' $WWW_CONF
sed -i 's|^[; ]*\(env\[PATH\] = \)|\1'"$PATH"'|' $WWW_CONF

usermod -u 33 www-data
groupmod -g 33 www-data
