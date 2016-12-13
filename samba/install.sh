#!/bin/bash

apt-get update
apt-get -y -q install samba-common samba

adduser --no-create-home --disabled-login --shell /bin/false --gecos "" www-data
#adduser --no-create-home --disabled-login --shell /bin/false --gecos "" admin

usermod -u 33 www-data
groupmod -g 33 www-data

(echo Holner2261; echo Holner2261) | smbpasswd -a www-data
#(echo Holner2261; echo Holner2261) | smbpasswd -a admin

mkdir -p /home/public

chown user /home/public
chgrp user /home/public

# insert "username map" option after [global]
sed -i $'/^\[global\]/a\ \ \ username map = \/etc\/samba\/usermap.conf' /etc/samba/smb.conf	
# comment printer shares
sed -i '/^\[printers\]/,/^$/{s/^/;/g}' /etc/samba/smb.conf
sed -i '/^\[print\$\]/,/guest ok/{s/^/;/g}' /etc/samba/smb.conf

cat << EOF | tee -a /etc/samba/smb.conf
[Public]
path = /home/public
public = no
writeable = yes
browseable = yes
create mask = 0664
directory mask = 0775
EOF

testparm

cat << EOF | tee -a /etc/samba/usermap.conf
www-data = user
EOF
