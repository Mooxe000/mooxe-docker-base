#
ImageName := mooxe/base:dev

build:
	@cmd="docker build" && \
	if [ ! -z ${MIRROR_LP} ]; then \
		cmd+=" --build-arg MIRROR_LP=$${MIRROR_LP}"; \
	fi && \
	cmd+=" -t ${ImageName} ." && \
	bash -c "$${cmd}"

# env MIRROR_LP="192.168.0.108:8080\\/launchpad" make rebuild

rebuild:
	@cmd="docker build" && \
	cmd+=" --no-cache"; \
	if [ ! -z ${MIRROR_LP} ]; then \
		cmd+=" --build-arg MIRROR_LP=$${MIRROR_LP}"; \
	fi && \
	cmd+=" -t ${ImageName} ." && \
	bash -c "$${cmd}"
