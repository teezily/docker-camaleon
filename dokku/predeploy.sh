#!/bin/bash

cd /home/app

echo 'Run database migrations'
bundle exec rake db:create db:migrate
