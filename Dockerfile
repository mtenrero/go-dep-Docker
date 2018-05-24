FROM golang:latest

RUN apt update -y \
  && apt install musl-dev -y
  
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

RUN mkdir -p .cache

RUN mkdir -p /go/src
RUN mkdir -p /go/pkg
RUN chmod -R 777 /go

ENV GOPATH=/go

# Install golang/dep
WORKDIR /root
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
ENV PATH="/root/bin:${PATH}"