FROM alpine:latest

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN echo "http://mirrors.cug.edu.cn/alpine/v3.3/main" \
      > /etc/apk/repositories && \
    echo "http://mirrors.cug.edu.cn/alpine/v3.3/community" \
      >> /etc/apk/repositories

RUN apk upgrade --update && \
    apk add --update \
      curl ca-certificates bash \
      coreutils ncurses util-linux bc sed mdocml-apropos \
      git zsh fish make tar grep

# Bash-it
RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git \
      ~/.bash_it && \
    bash -lc "~/.bash_it/install.sh"

# oh my zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git \
      ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    # sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# RUN git clone https://github.com/fisherman/fisherman \
#       ~/.local/share/fisherman && \
#
#     cd ~/.local/share/fisherman && \
#     make && cd ~

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

RUN echo "set fish_greeting ''" \
      > ~/.config/fish/config.fish && \
    echo "set -x LC_ALL en_US.UTF-8" \
      >> ~/.config/fish/config.fish && \
    echo "set -x LC_CTYPE en_US.UTF-8" \
      >> ~/.config/fish/config.fish

RUN rm -rf /var/cache/apk/*
