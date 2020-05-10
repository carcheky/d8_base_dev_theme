#!/bin/bash

git clone https://github.com/carcheky/druparcheky_theme.git druparcheky_tmp
rm -fr druparcheky_tmp/.git
bash druparcheky_tmp/generate-subtheme.sh
rm -fr druparcheky_tmp
