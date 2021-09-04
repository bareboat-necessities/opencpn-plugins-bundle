#!/bin/bash -e

xmlstarlet sel -t \
 -m "/plugins/plugin[normalize-space(target-arch)='armhf' and normalize-space(target)!='android-armhf' and normalize-space(target-version)=10]" \
 -o '"' -v "normalize-space(name)" -o '"' -o '                    ' -v "normalize-space(version)" \
 -n  ~/.opencpn/ocpn-plugins.xml | sort
