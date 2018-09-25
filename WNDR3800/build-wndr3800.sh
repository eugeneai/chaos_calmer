#!/bin/bash

cat list-installed.txt | cut -f1 -d" " | sort | tr '\n' ' ' > list.txt

# Check new modules before construction!!!!

FILES=`cat list.txt`
FILES="odhcpd $FILES"
make image PROFILE="WNDR3700" PACKAGES="$FILES"
make manifest PROFILE="WNDR3700" PACKAGES="$FILES" | tee MANIFEST.txt
