FROM alpine:edge
MAINTAINER Yann Hodique <hodiquey@vmware.com>

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
        libc6-compat \
        libssh \
        msgpack-c \
        ncurses-libs \
        libevent

ADD backtrace.patch /backtrace.patch
ADD message.sh /message.sh
ADD tmate-slave.sh /tmate-slave.sh

RUN apk add --no-cache --virtual build-dependencies \
        build-base \
        ca-certificates \
        bash \
        wget \
        git \
        openssh \
        libc6-compat \
        automake \
        autoconf \
        zlib-dev \
        libevent-dev \
        msgpack-c-dev \
        ncurses-dev \
        libexecinfo-dev \
        libssh-dev && \
    mkdir /src && \
    git clone https://github.com/tmate-io/tmate-slave.git /src/tmate-server && \
    cd /src/tmate-server && \
    git apply /backtrace.patch && \
    ./create_keys.sh && \
    mv keys /etc/tmate-keys && \
    ./autogen.sh && \
    ./configure CFLAGS="-D_GNU_SOURCE" && \
    make -j && \
    cp tmate-slave /bin/tmate-slave && \
    /bin/sh /tmp/message.sh && \
    apk del build-dependencies && \
    rm -rf /src

ENTRYPOINT ["/tmate-slave.sh"]