#!/usr/bin/env bash

ln -s /root/mirror/config/mirrors \
  /etc/nginx/sites-enabled/mirrors

mkdir -p /data/mirror/data
chown -R www-data:www-data /data/mirror/data

for pkg in `ls /data/mirror/tar`; do
  tar xvf /data/mirror/tar/${pkg} -C /data/mirror/data
done

service nginx restart
