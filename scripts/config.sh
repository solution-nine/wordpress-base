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
sed -i '' "s/example.com/${DOMAIN}.${TLD}/g" scripts/database_backup.sh
sed -i '' "s/example_com/${DOMAIN}_${TLD}/g" scripts/deploy.sh
sed -i '' "s/example_com/${DOMAIN}_${TLD}/g" scripts/provision.sh
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example.test/${DOMAIN}.test/g"
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example.com/${DOMAIN}.${TLD}/g"
find "trellis-config" -type f -print0 | xargs -0 sed -i '' "s/example_com/${DOMAIN}_${TLD}/g"
echo '[Setup Vault Password]'
openssl rand -base64 32 >> trellis-config/.vault_pass
echo '[Create Public Key]'
ssh-keygen -y -f ~/.ssh/${DOMAIN}_${TLD}_deploy.pem > ~/.ssh/${DOMAIN}_${TLD}_deploy.pub
echo '[Action Item: Save this password]'
echo $(<trellis-config/.vault_pass)