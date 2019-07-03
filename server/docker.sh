#!/usr/bin/env bash

apt-fast install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

curl -fsSL https://download.daocloud.io/docker/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
  "deb [arch=$(dpkg --print-architecture)] https://download.daocloud.io/docker/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

apt-fast update

apt-fast install -y -q docker-ce=*

curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io

service docker restart

curl -L https://github.com/docker/compose/releases/download/1.24.1/\
docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
