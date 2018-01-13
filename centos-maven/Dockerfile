FROM ivonet/centos-jdk:7-1.8.0

RUN yum -y update \
	&& yum -y install \
			--setopt=tsflags=nodocs \
			--disableplugin=fastestmirror \
		librados2.x86_64 \
  maven \
	&& yum clean all \
	&& rm -rf /etc/ld.so.cache

ADD setup/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /project
VOLUME ["/project", "/repository"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mvn", "verify"]

