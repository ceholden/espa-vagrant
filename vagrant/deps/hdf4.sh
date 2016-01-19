#!/bin/bash
# NOTE: using apt-get version instead of this script

set -e

if [[$(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be root"
    exit 1
fi

if [ -z $1 ]; then
    URL=https://www.hdfgroup.org/ftp/HDF/releases/HDF4.2.11/src/hdf-4.2.11.tar.gz
else
    echo "Using $1 for HDF4 download"
    URL=$1
fi

mkdir hdf4
wget $URL -O hdf4.tar.gz
tar xvf --strip-components=1 -C hdf4/ hdf4.tar.gz
cd hdf4

# Install into /usr/local
PREFIX=/usr/local/hdf4
mkdir -p $PREFIX

./configure --prefix=$PREFIX
make
make install
