#!/bin/bash -e

arch=armhf

if [ "$1" == "arm64" ]; then
  arch=arm64
fi

rm -rf tmp-o-bundle-$arch || exit 1
mkdir tmp-o-bundle-$arch || exit 2
cd tmp-o-bundle-$arch

wget -O opencpn-plugins-bundle-o_5_6_x-$arch.tar.gz https://github.com/bareboat-necessities/opencpn-plugins-bundle/blob/main/bundles/opencpn-plugins-bundle-o_5_6_x-$arch.tar.gz?raw=true
gzip -cd opencpn-plugins-bundle-o_5_6_x-$arch.tar.gz | tar xvf -

cp -r -p lib/* /usr/lib/
cp -r -p bin/* /usr/bin/
cp -r -p share/* /usr/share/

cd ..