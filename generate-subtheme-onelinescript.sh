#!/bin/bash

git clone https://github.com/carcheky/druparcheky_theme.git druparcheky_theme
rm -fr druparcheky_theme/.git
cp -fr druparcheky_theme/druparcheky_subtheme .
cd druparcheky_subtheme
bash generate-subtheme.sh
cd ..
rm -fr druparcheky_subtheme

