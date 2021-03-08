#!/usr/bin/env bash
echo '[Download Trellis]'
# git clone --depth=1 'https://github.com/roots/trellis.git' trellis
# rm -rf trellis/.git
# cp -r trellis-config/* trellis/
echo '[Setup Trellis]'
trellis init
# cd trellis/
# ansible-galaxy install -r galaxy.yml
# cd ..
echo '[Setup Scripts]'
