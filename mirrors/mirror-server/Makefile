#
ImageName := mooxe/mirror/server
ContainerName := mirror_server

build:
	docker build -t $(ImageName) .

rebuild:
	docker build --no-cache -t $(ImageName) .

in:
	docker run --rm -ti \
		--name $(ContainerName) \
		-p 8080:8080 \
		-v $$(pwd)/config:/root/mirror/config:ro \
		-v $$(pwd)/../mirror-data:/data/mirror/tar:ro \
		$(ImageName) bash

create:
	docker run -d -ti \
		--name $(ContainerName) \
		-p 8080:8080 \
		-v $$(pwd)/config:/root/mirror/config:ro \
		-v $$(pwd)/../mirror-data:/data/mirror/tar:ro \
		$(ImageName) \
		/usr/bin/env bash -c " \
			/root/mirror/config/init.sh && tail -f /dev/null"

logs:
	docker logs -f $(ContainerName)

remove:
	docker rm -f $(ContainerName)

exec:
	docker exec -ti $(ContainerName) bash
