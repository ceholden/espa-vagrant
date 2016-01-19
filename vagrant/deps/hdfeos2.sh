#!/bin/bash

set -e

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must run as root"
    exit 1
fi

if [ -z $1 ]; then
    URL=http://espa.cr.usgs.gov/downloads/auxiliaries/HDF-EOS2.19v1.00.tar.Z
else
    echo "Using $1 for HDF-EOS2 download"
    URL=$1
fi

wget $URL -O hdfeos2.tar.Z
tar -xvf hdfeos2.tar.Z
cd hdfeos/

# Install in /usr/local
PREFIX=/usr/local/hdf-eos2/
mkdir -p $PREFIX

./configure --enable-install-include --prefix=$PREFIX CC=$(which h4cc)
make
make install

sudo ldconfig
