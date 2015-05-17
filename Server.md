# Docker 宿主机 配置

- Web 控制台 重装系统 并 设定密码
- ssh 登陆系统


- 添加 docker 用户并设置密码

    $ groupadd wheel
    $ useradd docker -d /home/docker -m -g wheel -s /bin/bash
    $ echo "docker:netserver" | chpasswd

    $ locale-gen en_US.UTF-8
    $ /usr/sbin/update-locale LANG=en_US.UTF-8

    # visudo
    $ export EDITOR=/usr/bin/vim
    $ visudo
    # %wheel	ALL=(ALL:ALL) NOPASSWD: ALL

    $ su - docker

- 更新系统 并 安装 docker && fig

    $ sudo apt-get update
    $ sudo apt-get upgrade -y
    $ sudo apt-get install -y curl axel git-core

- zsh fish

    $ sudo apt-get install -y fish zsh

    # oh my zsh
    $ echo 'netserver' | zsh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # oh my fish
    $ curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
    $ sed -e "1i set fish_greeting ''" ~/.oh-my-fish/templates/config.fish > ~/.config/fish/config.fish

- docker

    $ sudo apt-get install -y docker.io
    $ sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
    $ sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
    $ curl -s https://get.docker.io/ubuntu/ | sudo sh

- docker-machine

    $ curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > docker-machine
    $ chown root:root docker-machine
    $ chmod +x docker-machine
    $ sudo mv docker-machine /usr/local/bin

- docker-compose

    $ sudo apt-get install -y python-pip
    $ sudo pip install -U docker-compose

- 配置 docker 不使用 sudo

    $ sudo groupadd docker
    $ sudo gpasswd -a ${USER} docker

- Web 控制台 重启系统 并 ssh 重登陆
