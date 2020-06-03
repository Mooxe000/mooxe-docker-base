#!/usr/bin/env bash

sudo apt-add-repository ppa:projectatomic/ppa && \
sudo apt-fast install -y podman buildah

cat <<EOF > $HOME/.config/containers/registries.conf
unqualified-search-registries = ['docker.io', 'k8s.gcr.io', 'quay.io']

[[registry]]
prefix = "docker.io"
location = "hub-mirror.c.163.com"

[[registry.mirror]]
prefix = "docker.io"
location = "dockerhub.azk8s.cn"

[[registry]]
prefix = "k8s.gcr.io"
location = "gcr.azk8s.cn/google_containers"

[[registry]]
prefix = "quay.io"
location = "quay.azk8s.cn"
EOF
