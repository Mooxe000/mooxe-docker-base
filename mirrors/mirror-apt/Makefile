#
ImageName := mooxe/mirror/apt
ContainerName := mirror_apt

build:
	docker build -t $(ImageName) .

rebuild:
	docker build --no-cache -t $(ImageName) .

in:
	docker run --rm --name $(ContainerName) \
		-ti \
		-v $$(pwd)/scripts:/root/mirror/scripts \
		-v $$(pwd)/scripts/mirror.list:/etc/apt/mirror.list \
		-v $$(pwd)/../mirror-data:/data/mirrors \
		$(ImageName)  \
		/usr/bin/env bash

rm:
	docker rm -f $(ContainerName)
