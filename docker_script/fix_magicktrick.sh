#!/bin/bash
set -e
source /docker_script/buildconfig
set -x


# Fix https://www.imagemagick.org/discourse-server/viewtopic.php?t=29588
cp /docker_script/policy.xml /etc/ImageMagick/policy.xml
