#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

mkdir /etc/service/stop_cron
mv /docker_script/stop_cron.sh /etc/service/stop_cron/run
chmod +x /etc/service/stop_cron/run
