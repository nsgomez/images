# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Debian
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ubuntu:rolling 

LABEL author="Nelson Gomez" maintainer="nelson.gomez.msd@gmail.com"

RUN apt update && apt -y upgrade \
    && apt -y install ca-certificates openssl binutils llvm heaptrack libasan4 libasan5 libubsan1 \
    && useradd -m -d /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
