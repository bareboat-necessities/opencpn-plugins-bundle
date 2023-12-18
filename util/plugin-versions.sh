#!/bin/bash -e

curl -s https://raw.githubusercontent.com/OpenCPN/plugins/master/ocpn-plugins.xml | \
xmlstarlet sel -t \
 -m "/plugins/plugin[normalize-space(target-arch)='armhf' and normalize-space(target)!='android-armhf' and normalize-space(target-version)=12]" \
 -v "str:align(concat('\"', normalize-space(name), '\"'), '                                  ')" -o ' ' \
 -v "str:align(concat('\"', normalize-space(version), '\"'), '                               ')" \
 -n - | sort
