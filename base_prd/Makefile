#
ImageName := mooxe/base:prd

build:
	buildah bud --layers -t $(ImageName) .

rebuild:
	buildah bud --no-cache -t $(ImageName) .

publish:
	buildah push ${ImageName}
