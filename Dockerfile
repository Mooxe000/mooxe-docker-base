FROM alpine:latest

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN apk upgrade --update && \
    apk add --update \
      curl ca-certificates bash \
      coreutils util-linux bc sed mdocml-apropos \
      git zsh fish make tar

RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
    bash -lc "~/.bash_it/install.sh"

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# RUN git clone https://github.com/fisherman/fisherman \
#       ~/.local/share/fisherman && \
#
#     cd ~/.local/share/fisherman && \
#     make && cd ~

# RUN fish -lc "fisher i robbyrussell"
RUN git clone https://github.com/oh-my-fish/theme-robbyrussell.git \
      ~/.config/fish/robbyrussell && \
    echo 'source ~/.config/fish/robbyrussell/fish_prompt.fish' >> \
      ~/.config/fish/config.fish

RUN mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak && \
    sed -e "1i \
set fish_greeting '' \n\
set -x LC_ALL en_US.UTF-8 \n\
set -x LC_CTYPE en_US.UTF-8 \n\
    " ~/.config/fish/config.fish.bak > ~/.config/fish/config.fish
