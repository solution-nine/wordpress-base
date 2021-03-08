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
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example.test/${DOMAIN}.test/g"
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example.com/${DOMAIN}.${TLD}/g"
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example_com/${DOMAIN}_${TLD}/g"
echo '[Setup Vault Password]'
openssl rand -base64 32 >> trellis-config/.vault_pass
echo '[TODO: Save this password]'
echo $(<trellis-config/.vault_pass)