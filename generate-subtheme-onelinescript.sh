#!/bin/bash

git clone https://github.com/carcheky/druparcheky_theme.git druparcheky_tmp
rm -fr druparcheky_tmp/.git
cd druparcheky_tmp
bash generate-subtheme.sh
cd ..
rm -fr druparcheky_tmp

