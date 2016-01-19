#!/bin/bash

set -e

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be root"
    exit 1
fi

# Get land/water mask
cd /usr/local/
wget -q http://espa.cr.usgs.gov/downloads/auxiliaries/land_water_poly/land_no_buf.ply.gz -O land_no_buf.ply.gz
gunzip -k -f land_no_buf.ply.gz
