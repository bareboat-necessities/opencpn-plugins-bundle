#!/bin/bash -e

name="${1}"
name_lower="${name,,}"
ver="${2}"
url="${3}"

mkdir -p "install_data" || exit 1
echo "$ver" > "install_data/$name_lower".version

mkdir -p "install_dir/$name_lower" || exit 2
cd "install_dir/$name_lower"
wget -q "$url"
cd ../..

