#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

gem install rails
rails new tz_camaleon --database=mysql
cd tz_camaleon
cat >> Gemfile << EOL
gem "camaleon_cms", github: 'owen2345/camaleon-cms'
gem "activemodel-serializers-xml", git: 'https://github.com/rails/activemodel-serializers-xml'
gem "draper", github: 'audionerd/draper', branch: 'rails5'
gem "bcrypt", '~>3.1.7'
EOL
bundle install
rails generate camaleon_cms:install