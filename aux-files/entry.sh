groupmod -o -g ${GID} www-data
usermod -o -u ${UID} www-data

chown -R www-data:www-data /downloads

su -c /usr/bin/aria2c --conf-path="" --enable-rpc --rpc-listen-all www-data

"${@-sh}"