#!/bin/bash

# SEE http://karthur.org/2015/ledaps-installation-ubuntu.html

mkdir -p ESPA && cd ESPA

git clone https://github.com/USGS-EROS/espa-product-formatter.git

# Dependencies (https://github.com/USGS-EROS/espa-product-formatter#dependencies)
sudo apt-get install \
        libgctp-dev \
        libgeotiff-dev \
        libtiff5-dev \
        libhdf4-dev \
        libhdfeos-dev \
        libjpeg-dev \
        zlib1g-dev \
        libxml2-dev

# Get land/water mask
mkdir -p DATA && cd DATA/
wget http://espa.cr.usgs.gov/downloads/auxiliaries/land_water_poly/land_no_buf.ply.gz -O lwmask.zip
unzip lwmask.zip
export ESPA_LAND_MASS_POLYGON=$(readlink -f land_no_buf.ply)
cd ..

# Export env vars
export HDFEOS_GCTPINC="/usr/include/gctp"
export HDFEOS_GCTPLIB="/usr/lib"
export TIFFINC="/usr/include/x86_64-linux-gnu/"
export TIFFLIB="/usr/lib/x86_64-linux-gnu/"
export GEOTIFF_INC="/usr/include/geotiff/"
export GEOTIFF_LIB="/usr/lib/"
export HDFINC="/usr/include/hdf/"
export HDFLIB="/usr/lib"
export HDFEOS_INC="/usr/include/x86_64-linux-gnu/"
export HDFEOS_LIB="/usr/lib/x86_64-linux-gnu/"
export JPEGINC="/usr/include/"
export JPEGLIB="/usr/lib/x86_64-linux-gnu/"
export XML2INC="/usr/include/libxml2/"
export XML2LIB="/usr/lib/x86_64-linux-gnu/"

export XML2INC="/usr/include/libxml2/"
export XML2LIB="/usr/lib/x86_64-linux-gnu/"
#export JBIGINC=""
#export JBIGLIB="path_to_JBIG_libraries"
export ZLIBINC="/usr/include/"
export ZLIBLIB="/usr/lib/x86_64-linux-gnu/"
export ESPAINC=""
export ESPALIB=""

cd espa-product-formatter
