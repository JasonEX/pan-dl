#!/bin/sh
groupmod -o -g ${GID} www-data
usermod -o -u ${UID} www-data

chown -R www-data:www-data /conf
chown -R www-data:www-data /downloads

sed -i '/^rpc-secret=.*$/d' /conf/aria2.conf
if [ -n "${RPC_SECRET}" ]; then
    echo 'rpc-secret='${RPC_SECRET}'' >> /conf/aria2.conf
fi

su -c '/usr/bin/aria2c --conf-path="/conf/aria2.conf"' www-data

exec "$@"