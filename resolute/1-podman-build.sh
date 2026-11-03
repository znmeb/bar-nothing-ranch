#! /bin/bash

set -eu

source set-envars
podman image build \
    --build-arg ADMIN_USER=$USER \
    --build-arg ADMIN_FULLNAME="Administrator" \
    --build-arg ADMIN_PASSWD="${ADMIN_PASSWD}" \
    --build-arg BASE_NAME="${BASE_NAME}" \
    --build-arg TIME_ZONE="$(timedatectl | grep 'Time zone' | sed 's/^.*zone: //' | sed 's/ .*$//')" \
    --dns 8.8.8.8 \
    --dns 1.1.1.1 \
    --pull=newer \
    --tag $BASE_NAME \
    --squash-all \
    .

podman image list
