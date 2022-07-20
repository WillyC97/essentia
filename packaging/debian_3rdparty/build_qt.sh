#!/usr/bin/env bash
set -e
. ../build_config.sh

rm -rf tmp
mkdir tmp
cd tmp

print_banner "Building qt from $QT_SOURCE_URL"

QT_FILE=${QT_SOURCE_URL##*/}

curl -SLO $QT_SOURCE_URL

tar -xf $QT_FILE
cd $(basename $QT_FILE .tar.gz)

./configure -prefix $PREFIX -static -opensource -confirm-license $QT_FLAGS

make
make install

cd ../..
rm -fr tmp

print_banner "qt build Successful"
