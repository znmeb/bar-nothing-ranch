#! /usr/bin/env bash

set -eu

source set-container-envars

echo "..Building $IMAGE_NAME"
podman image build \
  $NVIDIA_FLAGS \
  $SECURITY_FLAGS \
  --compress \
  --env ADMIN_USER=$USER \
  --env ADMIN_HOME=/home/$USER \
  --file Containerfile \
  --tag $IMAGE_NAME \
  --squash-all \
  .

echo ""
podman image list

echo "..Finished"
