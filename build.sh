#!/bin/bash

set -e

TAG=$(git tag --points-at HEAD)
IMAGE_NAME=andrewchen20/protoc_golang:$TAG

docker build -t "$IMAGE_NAME" .

sudo docker push "$IMAGE_NAME"
