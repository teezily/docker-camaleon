#!/bin/bash

if [ -z "$CRON_UP" ]; then
  echo "cron not run"
  sv stop /etc/service/cron
fi
sv stop /etc/service/stop_cron
exit 1
