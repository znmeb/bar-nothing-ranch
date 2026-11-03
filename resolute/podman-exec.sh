#! /bin/bash

set -eu

source set-envars
podman container exec \
    --interactive \
    --tty \
    --user $USER \
    --workdir "/home/${USER}" \
    $BASE_NAME \
    /bin/bash
