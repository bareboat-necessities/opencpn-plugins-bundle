#!/bin/bash -e

arch=arm64

if [ "$1" == "armhf" ]; then
  arch=armhf
fi

rm -rf tmp-bundle-$arch || exit 1
mkdir tmp-bundle-$arch || exit 2
cd tmp-bundle-$arch

xargs -n 3 -P 8 bash -c '../unpack-plugin.sh "$0" "$1" "$2"' < ../plugin-list-o_5_8_x-$arch-bullseye.txt

mkdir bundle || exit 3
for dir in download_dir/*/; do
  cd "$dir"
  files="$(ls -I metadata.xml -I manifest.json -I *.tar.gz)"
  for file in $files; do
    cp -r -p $file ../../bundle/
  done
  cd ../..
done

cd bundle
tar -czvf ../opencpn-plugins-bundle-o_5_8_x-bullseye-$arch.tar.gz .
cd ..

cd ..
