# Docker library build templates
# https://github.com/docker-library/docker/blob/master/Dockerfile-dind.template

# Use the official Docker-in-Docker Alpine image as base
# FROM docker:28.1.1-dind-alpine3.21
# switch to cli
# FROM 28.1.1-cli-alpine3.21
FROM code.forgejo.org/oci/docker:cli

# Install necessities
RUN apk add --no-cache bash curl g++ git \
    nodejs npm \
    make python3 tar wget xz zstd 

# Download Specific Node Version
#ENV NODE_VERSION=20.19.1

#RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64-musl.tar.xz -o /tmp/node.tar.xz && \
#    tar -xJf /tmp/node.tar.xz --strip-components=1 -C /usr/local && \
#    rm /tmp/node.tar.xz

#ENV PATH="/usr/local/bin:$PATH"

# Create directory for custom scripts
# RUN mkdir -p /usr/local/bin/custom-scripts

# Create dockerd wrapper
#RUN echo -e '#!/bin/sh\nexec /usr/local/bin/dockerd "$@" ${DOCKERD_EXTRA_OPTS:-}' > /usr/local/bin/custom-scripts/dockerd \
#    && chmod +x /usr/local/bin/custom-scripts/dockerd

# Create a init wrapper
#COPY init-entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/init-entrypoint.sh
