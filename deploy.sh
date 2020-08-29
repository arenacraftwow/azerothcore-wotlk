#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a SSH connection string";
  echo "For example username@deploy-target.com";
  echo "This requires you to use SSH keys!";
  exit -1;
fi;


echo "COMPILING..."
cd build
cmake ../ \
  -DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_INSTALL_PREFIX=/opt/wow_server \
	-DCONF_DIR=/opt/wow_server \
	-DTOOLS=1 \
	/
make -j $(nproc) install
cd ..
echo "DONE COMPILING"

sleep 3

echo "UPLOADING..."
rsync -rzvhP /opt/wow_server $1:/opt
echo "DONE UPLOADING"