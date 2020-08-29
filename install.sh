#!/bin/bash

set -e -x

pkill worldserver || true
pkill authserver || true

cd build
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
cmake ../ \
  -DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_INSTALL_PREFIX=/opt/wow_server \
	-DCONF_DIR=/opt/wow_server \
	-DTOOLS=1 \
	/
make -j $(nproc) install
cd ..