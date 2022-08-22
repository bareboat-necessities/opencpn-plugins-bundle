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
if [[ "$file" == *"flatpak"* ]]; then
  gzip -cd "$file" | tar xvf --strip-components=1 - > "../../install_data/$name_lower".files-tmp
else
  gzip -cd "$file" | tar xvf - > "../../install_data/$name_lower".files-tmp
fi

file_dir="$(ls -d */ | sed 's#/##')"

if [ ! -z "$file_dir" ]; then
  if [ -d "$file_dir"/usr/local ]; then
    if [ "$(ls -A "$file_dir"/usr/local)" ]; then
      mv "${file_dir:?}"/usr/local/* .
    fi
    rm -rf "${file_dir:?}"/usr/local
  fi

  if [ -d "$file_dir"/usr ]; then
    if [ "$(ls -A "$file_dir"/usr)" ]; then
      mv "${file_dir:?}"/usr/* .
    fi
    rm -rf "${file_dir:?}"/usr
  fi

  if [ -d "$file_dir"/ ]; then
    if [ "$(ls -A "$file_dir"/)" ]; then
      mv "${file_dir:?}"/* .
    fi
    rm -rf "${file_dir:?}"
  fi
fi

##file_dir="$(ls -d */ | sed 's#/##')"
#file_dir=""
#cp "../../install_data/$name_lower".files-tmp "../../install_data/$name_lower".dirs-tmp
#
#sed -i '/^'"$file_dir"'\/$/d' "../../install_data/$name_lower".files-tmp
#sed -i '/^'"$file_dir"'\/usr\/$/d' "../../install_data/$name_lower".files-tmp
#sed -i '/^metadata\.xml$/d' "../../install_data/$name_lower".files-tmp
##sed -i '/^.*\/$/d' "../../install_data/$name_lower".files-tmp
#sed -i 's#^'"$file_dir"'/usr/local/##' "../../install_data/$name_lower".files-tmp
#sed -i 's#^'"$file_dir"'/usr/##' "../../install_data/$name_lower".files-tmp
#sed -i 's#^'"$file_dir"'/##' "../../install_data/$name_lower".files-tmp
#
#sed -i '/^.*\/$/!d' "../../install_data/$name_lower".dirs-tmp

cd ../..

