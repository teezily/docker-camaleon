#!/bin/sh
# If you omit that part, the command will be run as root.
cd /home/app

if [ -z "$WEB_UP" ]; then
  echo "web not run"
  sv stop /etc/service/web
  sv stop /etc/service/nginx
  exit 1
fi

if [ -n "$DEV_BUILD" ]; then
  export HOME=/home/app
  exec bundle exec puma -C /home/app/docker_script/puma.rb
else
  chown app -R /home/app
  exec /sbin/setuser app bundle exec puma -C /home/app/docker_script/puma.rb
fi

