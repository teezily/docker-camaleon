#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

bundle exec rake assets:precompile
