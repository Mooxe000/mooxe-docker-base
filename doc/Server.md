# Docker 宿主机 配置

* Web 控制台 重装系统 并 设定密码
* ssh 登陆系统


* 添加 docker 用户并设置密码

```bash
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
```

* 更新系统 并 安装 docker && fig

```bash
$ sudo apt-get update
$ sudo apt-get upgrade -y
$ sudo apt-get install -y curl axel git-core nload htop
```

* zsh fish

```bash
$ sudo apt-get install -y fish zsh

# oh my zsh
$ echo 'netserver' | zsh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh my fish
$ curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
$ sed -e "1i set fish_greeting ''" ~/.oh-my-fish/templates/config.fish > ~/.config/fish/config.fish
```

* docker

```bash
$ sudo apt-get install -y docker.io
$ sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
$ sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
# $ sudo apt-get install apparmor lxc cgroup-lite
$ curl -s https://get.docker.io/ubuntu/ | sudo sh

$ sudo rm -rf /var/lib/docker/devicemapper

$ sudo usermod -aG docker docker
$ sudo start docker

# $ sudo docker -d
```

* docker-machine

```bash
$ curl -L https://github.com/docker/machine/releases/download/v0.3.0/docker-machine_linux-amd64 > docker-machine
$ sudo chown root:root docker-machine
$ sudo chmod +x docker-machine
$ sudo mv docker-machine /usr/local/bin

$ docker-machine create -d virtualbox dev
$ docker-machine ls
$ eval "$(docker-machine env dev)"
$ eval "$(boot2docker shellinit)"
```

* docker-compose

```bash
$ sudo apt-get install -y python-pip
$ sudo pip install -U docker-compose
```

* 配置 docker 不使用 sudo

```bash
$ sudo groupadd docker
$ sudo gpasswd -a ${USER} docker
```

* daocloud 加速

```bash
$ echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=http://c2095577.m.daocloud.io\"" | sudo tee -a /etc/default/docker
$ sudo service docker restart
```

* Web 控制台 重启系统 并 ssh 重登陆
