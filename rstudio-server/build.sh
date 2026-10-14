#! /bin/bash

set -eu

podman build \
    --build-arg RSTUDIO_USER=znmeb \
    --build-arg RSTUDIO_FULLNAME="RStudio User" \
    --build-arg RSTUDIO_PASSWD="${RSTUDIO_PASSWD}" \
    --build-arg RSTUDIO_PACKAGE="https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2026.09.0-174-amd64.deb" \
    --dns 8.8.8.8 \
    --dns 1.1.1.1 \
    --tag rstudio-server \
    .

podman run \
    --detach \
    --name rstudio_server \
    --publish 8787:8787 \
    --replace \
    rstudio-server:latest \
    /sbin/init
