FROM ubuntu:17.04
MAINTAINER Ivo Woltring <webmaster@ivonet.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8

VOLUME '/input'
VOLUME '/output'

RUN apt-get update \
    && apt-get -y --no-install-recommends install software-properties-common \
    && add-apt-repository -y ppa:stebbins/handbrake-releases \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
    handbrake-cli \
    mkvtoolnix \
    ffmpeg \
    && apt-get clean

CMD ["-h"]
ENTRYPOINT ["HandBrakeCLI"]