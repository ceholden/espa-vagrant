#!/bin/bash

set -e

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be root"
    exit 1
fi

source /vagrant/setup_envvars.sh

# Install into /usr/local
export PREFIX=/usr/local/espa-product-formatter
mkdir -p $PREFIX/bin

# Clone
mkdir -p ESPA && cd ESPA
if [ -d espa-product-formatter ]; then
    rm -rf espa-product-formatter
fi
git clone https://github.com/USGS-EROS/espa-product-formatter.git
cd espa-product-formatter

# Get latest tag
git checkout $(git describe --abbrev=0)


# First, build the src/raw_binary tools for ESPAINC/ESPALIB
cd src/raw_binary/
make
echo "Installing bin/"
make install

echo "Installing python/schema"
cd ../../
make install  # install python/schema

sudo ldconfig
