#!/bin/bash

cd /home/app

echo 'Precompile assets'
bundle exec RAILS_ENV=production rake assets:precompile
