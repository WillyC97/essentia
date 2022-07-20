#!/usr/bin/env bash
set -e
BASEDIR=$(dirname $0)
. $BASEDIR/print_utils.sh
cd $BASEDIR/debian_3rdparty
./build_eigen3.sh        || abort "build_eigen3 failed"
./build_fftw3.sh         || abort "build_fftw3 failed"
./build_lame.sh          || abort "build_lame failed"
./build_ffmpeg.sh        || abort "build_ffmpeg failed"
./build_libsamplerate.sh || abort "build_libsamplerate failed"
./build_zlib.sh          || abort "build_zlib failed"
./build_taglib.sh        || abort "build_taglib failed"
./build_yaml.sh          || abort "build_yaml failed"
./build_chromaprint.sh   || abort "build_chromaprint failed"

#!/usr/bin/env bash
if [[ "$*" == *--with-gaia* ]]
    then
        ./build_qt.sh   || abort "build_qt failed"
        ./build_gaia.sh || abort "build_gaia failed"
        rm -rf mkspecs plugins translations
fi

if [[ "$*" == *--with-tensorflow* ]]
    then
        ./build_tensorflow.sh || abort "build_tensorflow failed"
fi

rm -rf bin share

print_banner "All dependencies built successfully"
