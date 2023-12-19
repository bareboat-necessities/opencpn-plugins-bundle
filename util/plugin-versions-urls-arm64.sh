#!/bin/bash -e

curl -s https://raw.githubusercontent.com/OpenCPN/plugins/master/ocpn-plugins.xml | \
xmlstarlet sel -t \
 -m "/plugins/plugin[(normalize-space(target-arch)='arm64' or normalize-space(target-arch)='aarch64') and normalize-space(target)!='android-arm64']" \
 -v "str:align(concat('\"', normalize-space(name), '\"'), '                                       ')" -o ' ' \
 -v "str:align(concat('\"', normalize-space(version), '\"'), '                                    ')" -o ' ' \
 -v "concat('\"', normalize-space(tarball-url), '\"')" \
 -n - | grep -v bionic | grep -v buster | grep -v ubuntu | grep -v bullseye | grep -v arm64-11 | \
 grep -v ebian-11 | grep -v "calculator-alpha" | sort
