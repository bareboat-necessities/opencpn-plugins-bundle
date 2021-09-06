#!/bin/bash -e

arch=armhf

if [ "$1" == "arm64" ]; then
  arch=arm64
fi

rm -rf tmp-bundle-$arch || exit 1
mkdir tmp-bundle-$arch || exit 2
cd tmp-bundle-$arch

cat ../plugin-list-$arch-buster.txt | xargs -n 3 -P 8 bash -c 'wget -q $2'
find . -name \*.tar.gz -print0 | xargs -0 -n 1 -P 8 bash -c 'echo $0'

cd ..
