FROM mooxe/base:prd

MAINTAINER FooTearth "footearth@gmail.com"

# extra ppa
RUN \
  apt install -y software-properties-common && \
  add-apt-repository ppa:git-core/ppa && \
  add-apt-repository ppa:fish-shell/nightly-master

# system update
RUN \
  apt update && \
  apt -y upgrade

RUN apt install -y git

# zsh && fish
RUN apt install -y fish zsh

RUN \
  apt autoremove -y && \
  apt clean

# Bash-it
RUN \
  git clone --depth=1 https://github.com/Bash-it/bash-it.git \
    ~/.bash_it && \
  bash -lc "~/.bash_it/install.sh"

# on my zsh
RUN \
  git clone https://github.com/robbyrussell/oh-my-zsh.git \
    ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fisherman
# curl -sL get.fisherman.sh | fish
RUN \
  curl -Lo ~/.config/fish/functions/fisher.fish \
    --create-dirs git.io/fisherman
# RUN git clone https://github.com/fisherman/fisherman ~/.local/share/fisherman && \
#   cd ~/.local/share/fisherman && \
#   make && cd ~

RUN fish -lc "fisher omf/theme-robbyrussell"
# RUN git clone https://github.com/oh-my-fish/theme-robbyrussell.git \
#     ~/.config/fisherman/cache/robbyrussell && \
#   echo 'source ~/.config/fisherman/cache/robbyrussell/fish_prompt.fish' >> \
#     ~/.config/fish/config.fish

RUN echo "\
set fish_greeting '' \n\
set -x LC_ALL en_US.UTF-8 \n\
set -x LC_CTYPE en_US.UTF-8 \
  " > ~/.config/fish/config.fish
