#!/bin/bash

# if [ -z "$RECAPTCHA_SECRET" ]; then
#   echo "Need RECAPTCHA_SECRET env variable"
#   exit -1
# fi

cd "$(dirname "$0")"

rm ./server/build -rf
cd website 
npm install --no-audit
npm run build
mv build ../server/build
cd ../server
pkg --targets node12-linux-x64 .
