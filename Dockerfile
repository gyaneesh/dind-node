# Docker library build templates
# https://github.com/docker-library/docker/blob/master/Dockerfile-dind.template

# Use the official Docker-in-Docker Alpine image as base
FROM docker:28.1.1-dind-alpine3.21
#FROM docker:dind-alpine3.21

# Install Node.js and npm
RUN apk add --no-cache curl bash zstd 

# Set the Node.js version
ENV NODE_VERSION=20.19.1

# Download and install Node.js
RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64-musl.tar.xz -o node.tar.xz && \
    tar -xJf node.tar.xz --strip-components=1 -C /usr/local && \
    rm node.tar.xz

# Set the PATH environment variable
ENV PATH="/usr/local/bin:$PATH"
