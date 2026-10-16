#! /bin/bash

set -eu

if [[ "$(uname -m)" == "x86_64" \
  && "$(which nvidia-ctk 2> /dev/null | wc -l)" -gt "0" \
  && "$(nvidia-ctk cdi list | grep gpu | wc -l)" -gt "0" ]]

then
  export NVIDIA_FLAGS="--device=nvidia.com/gpu=all"

else
  export NVIDIA_FLAGS=""

fi

podman container run \
    --interactive \
    --tty \
    --name unsloth \
    --hostname unsloth \
    --env JUPYTER_PASSWORD=$RSTUDIO_PASSWORD \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --publish 8000:8000 \
    --publish 8888:8888 \
    --replace \
    --security-opt=label=disable \
    --volume "$PWD":/workspace/host \
    --volume "$HOME/.cache/huggingface":/workspace/.cache/huggingface \
    --volume unsloth-studio:/opt/unsloth-studio \
    $NVIDIA_FLAGS \
    docker.io/unsloth/unsloth

podman container list
