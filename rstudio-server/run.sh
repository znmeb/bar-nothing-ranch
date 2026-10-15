#! /bin/bash

set -eu

podman container run \
    --detach \
    --name rstudio-server \
    --hostname rstudio-server \
    --publish 8787:8787 \
    --replace \
    rstudio-server:latest \
    /sbin/init

podman container list
