#! /bin/bash

set -eu

# https://gforth.org
export GFORTH_REPO="https://github.com/forthy42/gforth.git"
export GFORTH_BRANCH="1.0.1"
export LOGFILE="$HOME/Logfiles/install-gforth.log"
echo "LOGFILE: $LOGFILE"
echo "install-gforth.sh" \
    > $LOGFILE

pushd $HOME/Projects > /dev/null

    echo "..Cloning $GFORTH_REPO $GFORTH_BRANCH" \
        | tee -a $LOGFILE
    rm -fr gforth
    git clone --branch $GFORTH_BRANCH $GFORTH_REPO \
        >> $LOGFILE 2>&1
    cd gforth

    echo "..install-deps.sh" \
        | tee -a $LOGFILE
    ./install-deps.sh \
        >> $LOGFILE 2>&1

    echo "..autogen.sh" \
        | tee -a $LOGFILE
    ./autogen.sh \
        >> $LOGFILE 2>&1

    echo "..configure" \
        | tee -a $LOGFILE
    ./configure \
        >> $LOGFILE 2>&1

    echo "..make" \
        | tee -a $LOGFILE
    make -j`nproc` \
        >> $LOGFILE 2>&1

    echo "..sudo make install" \
        | tee -a $LOGFILE
    sudo make install \
        >> $LOGFILE 2>&1

    popd > /dev/null

echo "..Finished" \
    | tee -a $LOGFILE
