#!/bin/bash -e

arch=armhf

if [ "$1" == "arm64" ]; then
  arch=arm64
fi

rm -rf tmp-bundle-$arch || exit 1
mkdir tmp-bundle-$arch || exit 2
cd tmp-bundle-$arch

xargs -n 3 -P 8 bash -c '../unpack-plugin.sh "$0" "$1" "$2"' < ../plugin-list-$arch-buster.txt

for dir in download_dir/*/; do
  echo $dir
done

cd ..
