#! /bin/bash

set -eu

podman image build \
    --build-arg RSTUDIO_USER=$USER \
    --build-arg RSTUDIO_FULLNAME="RStudio User" \
    --build-arg RSTUDIO_PASSWD="${RSTUDIO_PASSWD}" \
    --build-arg RSTUDIO_PACKAGE="https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2026.09.0-174-amd64.deb" \
    --build-arg TIME_ZONE="$(timedatectl | grep 'Time zone' | sed 's/^.*zone: //' | sed 's/ .*$//')" \
    --dns 8.8.8.8 \
    --dns 1.1.1.1 \
    --pull=newer \
    --tag rstudio-server \
    --squash-all \
    .

podman image list
