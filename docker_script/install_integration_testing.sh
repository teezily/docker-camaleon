#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

minimal_apt_get_install curl bzip2 libfreetype6 libfontconfig xvfb nodejs
minimal_apt_get_install graphviz

export PHANTOM_JS_VERSION=2.1.1-linux-x86_64
curl -sSL https://github.com/shingara/copi-phantom/raw/master/phantomjs-$PHANTOM_JS_VERSION.tar.bz2 | tar xjC /tmp
mkdir -p /srv/var
mv /tmp/phantomjs-$PHANTOM_JS_VERSION /srv/var/phantomjs
ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs
