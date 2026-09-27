#! /bin/bash -l

set -eu

mkdir --parents $HOME/.local/bin $HOME/Logfiles $HOME/Projects
for script in \
    command-line-base.sh \
    ai-tools.sh

do
    ./$script

done
