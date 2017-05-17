FROM mooxe/base:prd

MAINTAINER FooTearth "footearth@gmail.com"

# RUN \
#   apt-get install -y software-properties-common && \
#   add-apt-repository ppa:git-core/ppa && \
#   add-apt-repository ppa:fish-shell/nightly-master
#   add-apt-repository cloud-archive:ocata

# system update
RUN \
  apt-get update && \
  apt-get -y upgrade

RUN \
  apt-get install -y xz-utils make apt-mirror

RUN \
  apt-get autoremove -y && \
  apt-get clean
