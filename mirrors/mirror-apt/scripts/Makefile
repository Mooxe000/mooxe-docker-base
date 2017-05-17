#

ppa:
	apt-get install -y software-properties-common
	add-apt-repository ppa:git-core/ppa
	add-apt-repository ppa:fish-shell/nightly-maste
	add-apt-repository cloud-archive:ocata

sources:
	cat \
		/etc/apt/sources.list.d/fish-shell-ubuntu-nightly-master-xenial.list \
		/etc/apt/sources.list.d/git-core-ubuntu-ppa-xenial.list \
		> /etc/apt/mirror.list

mirror:
	apt-mirror

# /var/spool/apt-mirror/mirror
tar:
	for pkgName in `ls /var/spool/apt-mirror/mirror`; do \
		cd /var/spool/apt-mirror/mirror && \
		tar Jcvf /data/mirrors/$$pkgName.tar.xz $$pkgName; \
	done
