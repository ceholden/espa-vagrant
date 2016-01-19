#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be root"
    exit 1
fi

# Dependencies (https://github.com/USGS-EROS/espa-product-formatter#dependencies)
sudo apt-get install -y \
        libgeotiff-dev \
        libtiff5-dev \
        libhdf4-dev hdf4-tools \
        libjpeg-dev \
        zlib1g-dev \
        libxml2-dev
