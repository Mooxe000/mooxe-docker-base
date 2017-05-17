FROM mooxe/base:prd

MAINTAINER FooTearth "footearth@gmail.com"

# system update
RUN \
  apt-get update && \
  apt-get -y dist-upgrade

RUN apt-get install -y nginx xz-utils
ADD ./config /root/mirror/config

RUN \
  apt-get autoremove -y && \
  apt-get clean
