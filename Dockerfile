FROM ubuntu:latest

MAINTAINER FooTearth "footearth@gmail.com"

COPY resource/sources/163.sources.list /etc/apt/sources.list
COPY resource/sudoers /etc/sudoers

# SYSTEM

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /home/root

RUN \

  # Locale
  locale-gen en_US.UTF-8 && \
  /usr/sbin/update-locale LANG=en_US.UTF-8 && \

  # apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 && \
  # apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 && \

  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git-core curl && \

  # zsh && fish
  apt-get install -y fish zsh && \

  # oh my zsh
  zsh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \

  # oh my fish
  git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish && \
  mkdir -p ~/.config/fish && \
  sed -e "1i \
set fish_greeting '' \n\
set -x LC_ALL en_US.UTF-8 \n\
set -x LC_CTYPE en_US.UTF-8 \n\
  " ~/.oh-my-fish/templates/config.fish > ~/.config/fish/config.fish
