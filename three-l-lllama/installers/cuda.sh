#! /bin/bash -l

set -eu

source set-installer-envars
export LOGFILE=$HOME/Logfiles/cuda.log
rm --force $LOGFILE

if [[ "$(which nvidia-smi 2>/dev/null | wc -l)" -gt "0" \
    && "$(nvidia-smi --list-gpus 2>/dev/null | wc -l)" -gt "0" ]]

then

    # https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Debian
    echo "....Installing CUDA toolkit"
    pushd /tmp > /dev/null
        rm --force *.deb
        wget --quiet \
            https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2604/x86_64/cuda-keyring_1.1-1_all.deb
        sudo dpkg -i cuda-keyring_1.1-1_all.deb \
            >> $LOGFILE 2>&1
        sudo apt-get update \
            >> $LOGFILE 2>&1
        sudo apt-get -y install cuda-toolkit \
            >> $LOGFILE 2>&1

    popd > /dev/null
    echo "....CUDA toolkit is installed"

else
    echo "....NVIDIA GPU not found - not installing CUDA"

fi
echo "....Finished"
echo ""
