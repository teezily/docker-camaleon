#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

minimal_apt_get_install libmysqlclient-dev mysql-client-5.5