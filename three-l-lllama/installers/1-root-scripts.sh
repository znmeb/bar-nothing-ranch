#! /bin/bash -l

set -eu

mkdir --parents $HOME/Logfiles
for script in \
    base-packages.sh \
    llvm-apt.sh \
    cuda.sh \
    terralang.sh \
    update-search-databases.sh

do
    ./$script

done
