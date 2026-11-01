#! /bin/bash

set -eu

podman container exec \
    --interactive \
    --tty \
    --user $USER \
    --workdir "/home/${USER}" \
    stonking \
    /bin/bash
