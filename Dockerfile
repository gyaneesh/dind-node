# Docker library build templates
# https://github.com/docker-library/docker/blob/master/Dockerfile-dind.template

# Use the official Docker-in-Docker Alpine image as base
FROM docker:28.1.1-dind-alpine3.21
#FROM docker:dind-alpine3.21

# Install Node.js and npm
RUN apk add --no-cache nodejs npm
