#! /bin/bash

set -eu

# https://gforth.org
export GFORTH_REPO="https://github.com/forthy42/gforth.git"
export GFORTH_BRANCH="1.0.1"

echo "..Cloning $GFORTH_REPO $GFORTH_BRANCH"
rm -fr gforth
/usr/bin/time git clone --branch $GFORTH_BRANCH $GFORTH_REPO
cd gforth

echo "..install-deps.sh"
/usr/bin/time ./install-deps.sh

echo "..autogen.sh"
./autogen.sh

echo "..configure"
./configure

echo "..make"
/usr/bin/time make -j`nproc`

echo "..make install"
make install

echo "..Finished"
