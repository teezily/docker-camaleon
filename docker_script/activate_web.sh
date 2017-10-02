#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

mkdir /etc/service/web
mv /docker_script/web.sh /etc/service/web/run
chmod +x /etc/service/web/run
