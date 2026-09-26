#! /bin/bash

set -eu

source set-container-envars

podman container create \
    --pod $POD_NAME \
    --name $CONTAINER_NAME \
    $IMAGE_NAME

podman container list --all
