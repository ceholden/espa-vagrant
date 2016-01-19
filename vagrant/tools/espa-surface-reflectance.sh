#!/bin/bash

set -e

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be root"
    exit 1
fi

source /vagrant/setup_envvars.sh

# Install into /usr/local
export PREFIX=/usr/local/espa-surface-reflectance
mkdir -p $PREFIX/bin

# Clone
mkdir -p ESPA && cd ESPA
if [ -d espa-surface-reflectance ]; then
    rm -rf espa-surface-reflectance
fi
git clone https://github.com/USGS-EROS/espa-surface-reflectance.git
cd espa-surface-reflectance

# Get latest tag
git checkout $(git describe --abbrev=0)

# LT4, LT5, LE7
cd ledaps/ledapsSrc/src/
make
make install
cd ../../..

# LC8
cd not-validated-prototype-l8_sr/
# C version code
cd c_version/src/
make
make install
make clean
cd ../../
# Auxiliary files
cd landsat_aux/src/
make
make install
make clean
cd ../../
