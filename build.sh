#!/bin/bash

set -e

TAG=$(git tag --points-at HEAD)
IMAGE_NAME=andrewchen20/protoc-golang:$TAG

docker build . 

docker tag mockingbird:latest "$IMAGE_NAME"

sudo docker push "$IMAGE_NAME"
