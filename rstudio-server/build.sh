#! /bin/bash

set -eu

podman build \
    --tag rstudio-server \
    --build-arg RSTUDIO_USER=znmeb \
    --build-arg RSTUDIO_FULLNAME="RStudio User" \
    --build-arg RSTUDIO_PASSWD="${RSTUDIO_PASSWD}" \
    .
