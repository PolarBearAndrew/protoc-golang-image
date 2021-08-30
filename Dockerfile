FROM golang:1.16-alpine

RUN apk update && apk upgrade
RUN apk add unzip git protoc && apk add --update coreutils make
RUN wget -q -O protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.12.0/protoc-3.12.0-linux-x86_64.zip && unzip protoc.zip

RUN echo "[url \"git@github.com:\"]\n\tinsteadOf = https://github.com/" >> /root/.gitconfig
RUN mkdir /root/.ssh && echo "StrictHostKeyChecking no " > /root/.ssh/config

# ENV PATH="$PATH:$(go env GOPATH)/bin"
ENV PATH="/usr/local/go/bin:${PATH}"

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV SSH_PRIVATE_KEY ""
ENV GO111MODULE=on
ENV GOPRIVATE "github.com/AmazingTalker/*"