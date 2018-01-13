FROM centos:7

RUN yum -y update \
	&& yum -y install \
			--setopt=tsflags=nodocs \
			--disableplugin=fastestmirror \
		epel-release \
	&& yum -y install \
		inotify-tools \
		java-1.8.0-openjdk.i686 \
	&& yum clean all \
	&& rm -rf /etc/ld.so.cache

ENTRYPOINT ["/bin/true"]