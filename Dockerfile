# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Debian
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM debian:stable-slim

LABEL author="Nelson Gomez" maintainer="nelson.gomez.msd@gmail.com"

RUN apt update && apt -y install ca-certificates openssl binutils iproute2 \
    && useradd -m -d /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
