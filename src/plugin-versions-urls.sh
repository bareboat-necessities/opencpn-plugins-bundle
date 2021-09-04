#!/bin/bash -e

xmlstarlet sel -t \
 -m "/plugins/plugin[normalize-space(target-arch)='armhf' and normalize-space(target)!='android-armhf' and normalize-space(target-version)=10]" \
 -v "str:align(concat('\"', normalize-space(name), '\"'), '                                  ')" -o ' ' \
 -v "str:align(concat('\"', normalize-space(version), '\"'), '                               ')" -o ' ' \
 -v "concat('\"', normalize-space(tarball-url), '\"')" \
 -n  ~/.opencpn/ocpn-plugins.xml | sort
