FROM golang:1.16

RUN apt-get update && apt-get install unzip -y
RUN wget -q -O protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.12.0/protoc-3.12.0-linux-x86_64.zip && unzip protoc.zip
# RUN mv /go/bin/protoc /usr/local/bin/protoc && rm protoc.zip

RUN git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"

ENV GO111MODULE=on

ENV PATH="$PATH:$(go env GOPATH)/bin"
