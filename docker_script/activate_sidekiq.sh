#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

mkdir /etc/service/sidekiq
mv /docker_script/sidekiq.sh /etc/service/sidekiq/run
chmod +x /etc/service/sidekiq/run
