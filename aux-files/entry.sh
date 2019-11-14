groupmod -o -g ${GID} www-data
usermod -o -u ${UID} www-data

chown -R www-data:www-data /conf
chown -R www-data:www-data /downloads

su -c /usr/bin/aria2c --conf-path="/conf/aria2.conf" www-data

"${@-sh}"