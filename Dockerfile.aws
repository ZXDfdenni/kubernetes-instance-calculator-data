FROM node:14-slim

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

ENV VENDOR="LearnK8S"
ENV AUTHOR="Dwi Fahni Denni (@zeroc0d3)"
ENV IMG_NAME="k8s-calculator"
ENV IMG_VERSION="1.0.0"
ENV IMG_DESC="k8s-calculator docker image"
ENV IMG_ARCH="amd64/x86_64"

LABEL maintainer="$AUTHOR" \
    architecture="$IMG_ARCH" \
    golang-version="$GOLANG_VERSION" \
    alpine-version="$ALPINE_VERSION" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="$IMG_NAME" \
    org.label-schema.description="$IMG_DESC" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="$VENDOR" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="$IMG_VERSION" \
    org.opencontainers.image.authors="$AUTHOR" \
    org.opencontainers.image.description="$IMG_DESC" \
    org.opencontainers.image.vendor="$VENDOR" \
    org.opencontainers.image.version="$IMG_VERSION" \
    org.opencontainers.image.revision="$GIT_COMMIT" \
    org.opencontainers.image.created="$BUILD_DATE" \
    fr.hbis.docker.base.build-date="$BUILD_DATE" \
    fr.hbis.docker.base.name="$IMG_NAME" \
    fr.hbis.docker.base.vendor="$VENDOR" \
    fr.hbis.docker.base.version="$BUILD_VERSION"

USER root
RUN apt -o APT::Sandbox::User=root update; sync
RUN apt-get update; sync
RUN apt-get install -y curl \
    apt-transport-https \
    ca-certificates \
    git \
    jq \
    python3 \
    python3-pip \
    python3-setuptools \
    groff \
    less \
    && pip3 install --upgrade pip

# Added dependencies yarn
RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; sync
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update; sync 
RUN apt-get install -y yarn; sync

### AWSCLI INSTALLATION ###
RUN pip3 --no-cache-dir install --upgrade awscli boto3 awscost

# Setup UI
WORKDIR /webui
COPY ./src /webui

# Install Node Modules
RUN yarn install

RUN apt-get clean && apt-get autoremove -y; sync

# Setup exposed ports
EXPOSE 80 443

CMD []
