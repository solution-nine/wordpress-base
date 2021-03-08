#!/usr/bin/env bash
oIFS="$IFS"
IFS="."
declare -a site=($1)
IFS="$oIFS"
unset oIFS

DOMAIN=${site[0]}
TLD=${site[1]}

echo '[Configuring Site: ${1}]'
sed -i '' "s/example.com/${DOMAIN}.${TLD}/g" package.json
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example.com/${DOMAIN}.${TLD}/g"
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example_com/${DOMAIN}_${TLD}/g"