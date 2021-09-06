#!/bin/bash -e

name="${1}"
name_lower="${name,,}"
ver="${2}"
url="${3}"

mkdir -p "install_data" || exit 1
echo "$ver" > "install_data/$name_lower".version

mkdir -p "download_dir/$name_lower" || exit 2
cd "download_dir/$name_lower"
wget -q "$url"

file="$(ls *.tar.gz)"
gzip -cd "$file" | tar xvf - > "../../install_data/$name_lower".files-tmp
file_dir="$(ls -d */ | sed 's#/##')"
cp "../../install_data/$name_lower".files-tmp "../../install_data/$name_lower".dirs-tmp

sed -i '/^'"$file_dir"'\/$/d' "../../install_data/$name_lower".files-tmp
sed -i '/^'"$file_dir"'\/usr\/$/d' "../../install_data/$name_lower".files-tmp
sed -i '/^metadata\.xml$/d' "../../install_data/$name_lower".files-tmp
#sed -i '/^.*\/$/d' "../../install_data/$name_lower".files-tmp
sed -i 's#^'"$file_dir"'/usr/local/##' "../../install_data/$name_lower".files-tmp
sed -i 's#^'"$file_dir"'/usr/##' "../../install_data/$name_lower".files-tmp
sed -i 's#^'"$file_dir"'/##' "../../install_data/$name_lower".files-tmp

sed -i '/^.*\/$/!d' "../../install_data/$name_lower".dirs-tmp

cd ../..

