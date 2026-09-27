#! /bin/bash

set -eu

source set-container-envars

podman container create \
    --env ADMIN_USER=$USER \
    --env ADMIN_HOME=/home/$USER \
    --name $CONTAINER_NAME \
    --replace \
    --tty \
    $IMAGE_NAME
podman container list --all
