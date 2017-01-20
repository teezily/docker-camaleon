#!/bin/bash
set -e
source /docker_script/buildconfig
set -x

sed -i 's/#   ForwardAgent no/   ForwardAgent yes/' /etc/ssh/ssh_config
sed -i 's/#   IdentityFile ~\/.ssh\/id_rsa/   IdentityFile \/root\/.ssh\/id_rsa/' /etc/ssh/ssh_config
sed -i 's/#   StrictHostKeyChecking ask/   StrictHostKeyChecking no/' /etc/ssh/ssh_config
mv /docker_script/.ssh/id_rsa /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
