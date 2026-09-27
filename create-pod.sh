#! /bin/bash

set -eu

source set-pod-envars

podman pod create \
    $NVIDIA_FLAGS \
    $SECURITY_FLAGS \
    --hostname=$POD_NAME \
    --infra-name=$POD_NAME \
    --name=$POD_NAME \
    --replace \
    --userns=keep-id
podman pod list
