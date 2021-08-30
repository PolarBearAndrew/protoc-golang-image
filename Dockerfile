FROM golang:alpine3.14

RUN apt-get update && apt-get install unzip -y
RUN wget -q -O protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.12.0/protoc-3.12.0-linux-x86_64.zip && unzip protoc.zip
# RUN mv /go/bin/protoc /usr/local/bin/protoc && rm protoc.zip

RUN git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n\tControlMaster auto\n\tControlPersist 600\n\tControlPath /tmp/ssh-%r@%h:%p" >> /etc/ssh/ssh_config

ENV PATH="$PATH:$(go env GOPATH)/bin"

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV SSH_PRIVATE_KEY ""
ENV GO111MODULE=on
ENV GOPRIVATE "github.com/AmazingTalker/*"