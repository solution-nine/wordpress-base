#!/usr/bin/env bash

PASSWD_FILE=trellis/.vault_pass

echo '[Download Trellis]============='
git clone --depth=1 'https://github.com/roots/trellis.git' trellis
rm -rf trellis/.git
cp -r trellis-config/* trellis/
cp trellis-config/.vault_pass $PASSWD_FILE
echo '[Setup Trellis]================'
trellis init
cd trellis/
ansible-galaxy install -r galaxy.yml
cd ..
echo '[Setup Scripts]================'
if ! test -f "$PASSWD_FILE"; then
echo $ANSIBLE_VAULT_PASSWORD >> $PASSWD_FILE
fi