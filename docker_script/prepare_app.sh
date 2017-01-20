#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

mkdir /app

cd /home/app

bundle install
bundle exec whenever --update-crontab
bundle exec rake assets:precompile
bundle exec rake swagger:docs
