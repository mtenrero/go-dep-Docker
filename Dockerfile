FROM golang:alpine

RUN apk update \
  && apk add ca-certificates wget unzip git \
  && update-ca-certificates \
  && apk add curl \
  && apk add gcc \
  && apk add musl-dev \
  && apk add bash

RUN mkdir -p .cache

# Install golang/dep
WORKDIR /root
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
ENV PATH="/root/bin:${PATH}"