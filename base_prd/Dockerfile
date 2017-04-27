FROM ubuntu:16.04

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

ENV \
  SYSMIRROR_163=mirrors.163.com \
  SYSMIRROR_aliyun=mirrors.aliyun.com \
  SYSMIRROR_souhu=mirrors.souhu.com \
  SYSMIRROR_ustc=mirrors.ustc.edu.cn
ENV SOURCES_FILE=/etc/apt/sources.list

# Update sources list
RUN \
  export SYSMIRROR=${SYSMIRROR_aliyun} && \
  sed -i \
    -e "s/archive.ubuntu.com/${SYSMIRROR}/g" \
    -e "s/security.ubuntu.com/${SYSMIRROR}/g" \
    ${SOURCES_FILE}

# system update
RUN \
  apt update && \
  apt -y upgrade

RUN apt install -y curl

RUN \
  apt autoremove -y && \
  apt clean
