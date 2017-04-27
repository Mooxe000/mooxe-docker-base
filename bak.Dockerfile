FROM ubuntu:14.04

MAINTAINER FooTearth "footearth@gmail.com"

COPY resource/sources /etc/apt/china

# TODO use gosu
# COPY resource/sudoers /etc/sudoers

# COPY resource/install_omf.py /tmp/omf/install_omf.py

# SYSTEM

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /root

RUN cp /etc/apt/sources.list /etc/apt/china/ubuntu && \
    # cp /etc/apt/china/sohu /etc/apt/sources.list
    cp /etc/apt/china/aliyun /etc/apt/sources.list

# Locale
RUN locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \

    apt-key adv --recv-keys \
      --keyserver keyserver.ubuntu.com \
      40976EAF437D05B5 3B4FE6ACC0B21F32
    # apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 && \
    # apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

# system update
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove

# extra ppa
RUN apt-get install -y software-properties-common && \

    add-apt-repository ppa:git-core/ppa && \
    add-apt-repository ppa:fish-shell/nightly-master

RUN apt-get install -y aptitude

# system update
RUN aptitude update && \
    aptitude upgrade -y && \
    apt-get autoremove -y

RUN aptitude install -y git-core curl axel htop make

# Bash-it
RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git \
      ~/.bash_it && \
    bash -lc "~/.bash_it/install.sh"

# zsh && fish
RUN aptitude install -y fish zsh

# oh my zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git \
      ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    # sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fisherman
# curl -sL get.fisherman.sh | fish
RUN curl -Lo ~/.config/fish/functions/fisher.fish \
      --create-dirs git.io/fisherman
# RUN git clone https://github.com/fisherman/fisherman ~/.local/share/fisherman && \
#
#     cd ~/.local/share/fisherman && \
#     make && cd ~

RUN fish -lc "fisher omf/theme-robbyrussell"
# RUN git clone https://github.com/oh-my-fish/theme-robbyrussell.git \
#       ~/.config/fisherman/cache/robbyrussell && \
#     echo 'source ~/.config/fisherman/cache/robbyrussell/fish_prompt.fish' >> \
#       ~/.config/fish/config.fish

RUN echo "\
set fish_greeting '' \n\
set -x LC_ALL en_US.UTF-8 \n\
set -x LC_CTYPE en_US.UTF-8 \
  " > ~/.config/fish/config.fish

# RUN cp /etc/apt/china/aliyun /etc/apt/sources.list
