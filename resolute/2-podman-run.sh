#! /bin/bash

set -eu

source set-envars

if [[ "$(uname -m)" == "x86_64" \
  && "$(which nvidia-ctk 2> /dev/null | wc -l)" -gt "0" \
  && "$(nvidia-ctk cdi list | grep gpu | wc -l)" -gt "0" ]]

then
  export NVIDIA_FLAGS="--device=nvidia.com/gpu=all"

else
  export NVIDIA_FLAGS=""

fi

podman container run \
    --detach \
    --name $BASE_NAME \
    --hostname $BASE_NAME \
    --replace \
    --security-opt=label=disable \
    $NVIDIA_FLAGS \
    $BASE_NAME:latest \
    /sbin/init

podman container list
