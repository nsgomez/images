# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM debian:stretch-slim

MAINTAINER Nelson Gomez <nelson.gomez@columbia.edu>

RUN apt-get -qq -y update && \
    apt-get -y install fontconfig-config fonts-dejavu-core \
        libcairo2 libfontconfig1 libogg0 libpixman-1-0 \
        libspeex1 libtheora0 libvorbis0a libx11-6 libx11-data \
        libxau6 libxcb-render0 libxcb-shm0 libxcb1 libxdmcp6 \
        libxext6 libxrender1 libcurl3-gnutls libicu57 libxml2 \
        libxslt1.1 sgml-base xml-core iproute2 && \
    apt-get clean

RUN useradd -m -d /home/container container
USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
