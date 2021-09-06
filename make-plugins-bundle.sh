#!/bin/bash -e

arch=armhf

if [ "$1" == "arm64" ]; then
  arch=arm64
fi

rm -rf tmp-bundle-$arch || exit 1
mkdir tmp-bundle-$arch || exit 2
cd tmp-bundle-$arch

xargs -n 3 -P 8 bash -c '../unpack-plugin.sh "$0" "$1" "$2"' < ../plugin-list-$arch-buster.txt

mkdir bundle || exit 3
for dir in download_dir/*/; do
  cd "$dir"
  files="$(ls -I metadata.xml -I *.tar.gz)"
  for file in $files; do
    cp -r -p $file ../../bundle/
  done
  cd ../..
done

cd ..
