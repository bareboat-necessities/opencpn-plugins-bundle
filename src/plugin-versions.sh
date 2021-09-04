#!/bin/bash -e

xmlstarlet sel -t \
 -m "/plugins/plugin[normalize-space(target-arch)='armhf' and normalize-space(target)!='android-armhf' and normalize-space(target-version)=10]" \
 -v "str:align(concat('\"', normalize-space(name), '\"'), '                                         ')" -o ' ' \
 -v "normalize-space(version)" \
 -n  ~/.opencpn/ocpn-plugins.xml | sort
