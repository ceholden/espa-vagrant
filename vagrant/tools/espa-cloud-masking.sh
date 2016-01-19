#!/bin/bash

set -e

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be root"
    exit 1
fi

source /vagrant/setup_envvars.sh

# Install into /usr/local
export PREFIX=/usr/local/espa-cloud-masking
mkdir -p $PREFIX/bin

# Clone
mkdir -p ESPA && cd ESPA
if [ -d espa-cloud-masking ]; then
    rm -rf espa-cloud-masking
fi
git clone https://github.com/USGS-EROS/espa-cloud-masking.git
cd espa-cloud-masking

# Get latest tag
git checkout $(git describe --abbrev=0)

make
make install
