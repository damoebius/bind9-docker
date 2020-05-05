FROM ubuntu:xenial
LABEL maintainer="damoebius"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
	bind9 \
	wget && \
 echo "**** user configuration ****" && \
 usermod -u 1000 bind && \
 groupmod -g 1000 bind && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

VOLUME /etc/bind
EXPOSE 53

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
