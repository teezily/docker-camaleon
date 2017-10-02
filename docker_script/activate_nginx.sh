#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

rm -f /etc/service/nginx/down
rm /etc/nginx/sites-enabled/default
mv /docker_script/webapp.conf /etc/nginx/sites-enabled/webapp.conf
