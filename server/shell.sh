#!/usr/bin/env bash

git clone --depth=1 https://github.com/Bash-it/bash-it.git \
  ~/.bash_it && \
bash -lc "~/.bash_it/install.sh"

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git \
  ~/.oh-my-zsh && \
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

curl -L https://get.oh-my.fish > install && \
fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf && \
rm -rf install

fish -lc "omf install robbyrussell"

cat << EOF > ~/.config/fish/config.fish
set fish_greeting ''
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
EOF
