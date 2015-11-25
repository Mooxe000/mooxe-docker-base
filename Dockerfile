FROM ubuntu:latest

MAINTAINER FooTearth "footearth@gmail.com"

COPY resource/sources /etc/apt/china
COPY resource/sudoers /etc/sudoers

COPY resource/install_omf.py /tmp/omf/install_omf.py

# SYSTEM

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /root

RUN cp /etc/apt/sources.list /etc/apt/china/ubuntu && \
    cp /etc/apt/china/aliyun /etc/apt/sources.list

# Locale
RUN locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \

    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

# system update
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove

RUN apt-get install -y aptitude && \
    apt-get install -y git-core curl axel htop && \

    # extra ppa
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:fish-shell/nightly-master

# system update
RUN aptitude update && \
    aptitude upgrade -y && \
    apt-get autoremove -y

# Bash-it
RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
    bash -lc "~/.bash_it/install.sh"

# zsh && fish
RUN apt-get install -y fish zsh

# oh my zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    # sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh my fish
RUN mkdir -p /tmp/omf && \
    # curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

    curl -L \
      -o /tmp/omf/install \
      "http://git.io/omf" \
    && \

    chmod +x /tmp/omf/install && \
    chmod +x /tmp/omf/install_omf.py && \
    bash -lc '/tmp/omf/install_omf.py' && \
    bash -lc '/tmp/omf/install'

RUN mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak && \
    sed -e "1i \
set fish_greeting '' \n\
set -x LC_ALL en_US.UTF-8 \n\
set -x LC_CTYPE en_US.UTF-8 \n\
    " ~/.config/fish/config.fish.bak > ~/.config/fish/config.fish && \
    fish -c 'omf install robbyrussell'
