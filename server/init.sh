#!/usr/bin/env bash

apt-get install -y curl apt-utils

apt-get install -y software-properties-common && \
add-apt-repository ppa:git-core/ppa && \
apt-add-repository ppa:fish-shell/release-3 && \
apt-add-repository ppa:apt-fast/stable

apt-get update && \
apt-get -y upgrade && \
apt-get autoremove -y

apt-get -y install aria2 wget apt-fast
# /bin/bash -c "$(curl -sL https://git.io/vokNn)"

apt-fast update && \
apt-fast -y upgrade

apt-fast install -y git fish zsh
apt-fast install -y axel htop nload
