#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

ruby-switch --set ruby2.3

/docker_script/install_mysql_client.sh
/docker_script/install_integration_testing.sh
/docker_script/ssh_config.sh
/docker_script/activate_nginx.sh
/docker_script/activate_web.sh
/docker_script/stop_cron_service.sh
/docker_script/fix_magicktrick.sh

minimal_apt_get_install

/docker_script/clean.sh
