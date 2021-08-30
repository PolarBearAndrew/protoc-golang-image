#!/bin/sh
set -e

if [ -z "$SSH_PRIVATE_KEY" ]
then
    echo SSH_PRIVATE_KEY is not provided.
else
    mkdir -p /root/.ssh
    echo "$SSH_PRIVATE_KEY" | base64 --decode > /root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
fi

exec "$@"