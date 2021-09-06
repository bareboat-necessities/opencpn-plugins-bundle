#!/bin/bash -e

arch=armhf

if [ "$1" == "arm64" ]; then
  arch=arm64
fi

mkdir tmp-bundle-$arch || exit 1
cd tmp-bundle-$arch

cat ../plugin-list-$arch-buster.txt | xargs -n 3 -P 8 bash -c 'wget -q $2'

cd ..
