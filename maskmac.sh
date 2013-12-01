#!/bin/bash

while read line; do
[ "$(echo ${line} | grep \"label\"\ \:\ \"TT\")" != "" ] && {
orimac=$(echo ${line} | sed -e "s/.*\"gateway\" : \"//g" -e "s/\".*//g")
md5mac=$(echo ${orimac} | md5sum | sed -e "s/ .*//g")
echo ${line} | sed -e "s/${orimac}/${md5mac}/g"
} || echo ${line}
done

