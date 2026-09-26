#! /bin/bash

set -eu

source set-pod-envars

podman pod create \
    --name $POD_NAME
podman pod list
