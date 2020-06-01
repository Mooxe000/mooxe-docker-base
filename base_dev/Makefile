#
ImageName := mooxe/base:dev

build:
	@cmd="buildah bud --layers" && \
	if [ ! -z ${MIRROR_LP} ]; then \
		cmd="$${cmd} \
			--build-arg MIRROR_LP=$${MIRROR_LP} \
		"; \
	fi && \
	cmd="$${cmd} \
		--build-arg http_proxy=$${http_proxy} \
		--build-arg https_proxy=$${https_proxy} \
		--build-arg HTTP_PROXY=$${http_proxy} \
		--build-arg HTTPS_PROXY=$${https_proxy} \
		-t ${ImageName} . \
	" && \
	bash -c "$${cmd}"

# env MIRROR_LP="192.168.0.108:8080\\/launchpad" make rebuild

rebuild:
	@cmd="buildah bud --no-cache" && \
	cmd="$${cmd}"; \
	if [ ! -z ${MIRROR_LP} ]; then \
		cmd="$${cmd} \
			--build-arg MIRROR_LP=$${MIRROR_LP} \
		"; \
	fi && \
	cmd="$${cmd} \
		--build-arg http_proxy=$${http_proxy} \
		--build-arg https_proxy=$${https_proxy} \
		--build-arg HTTP_PROXY=$${http_proxy} \
		--build-arg HTTPS_PROXY=$${https_proxy} \
		-t ${ImageName} . \
	" && \
	bash -c "$${cmd}"

publish:
	buildah push ${ImageName}
