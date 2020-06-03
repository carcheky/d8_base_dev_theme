#!/bin/bash
# vars
ORIGINAL_DIR=$(pwd)
sudo apt install rename -y
sudo apt autoremove


# logic

if [ ! $1 ]; then
  echo "nombre del tema:"
  read THEME_NAME
  # THEME_NAME=${THEME_NAME}
fi

if [ $1 ]; then
  THEME_NAME=${1}
  NEW_DIR=$(drush dd)/themes/custom/${THEME_NAME}
  echo "===================================================================="
  echo "===================================================================="
  echo "=> OLD theme ${ORIGINAL_DIR}"
  echo "=> NEW theme in ${NEW_DIR}"
  echo "===================================================================="
  echo "===================================================================="
fi

if [ ! -d $(drush dd)/themes/custom ]; then
  mkdir -p $(drush dd)/themes/custom
fi

if [ -d ${NEW_DIR} ]; then
  echo "=> ya existe ${THEME_NAME}, cancelando"
  exit
fi
if [ ! -d ${NEW_DIR} ]; then
  echo "=> creando ${THEME_NAME}"
  cp -fr ${ORIGINAL_DIR} ${NEW_DIR}
  cd ${NEW_DIR}
  sudo rm -fr .git
  mv druparcheky_subtheme.info.yml.example druparcheky_subtheme.info.yml
  rename "s/^druparcheky_subtheme/$THEME_NAME/" druparcheky_subtheme*
  find ${NEW_DIR} -type f -print0 | xargs -0 sed -i "s/druparcheky_subtheme/$THEME_NAME/g"
  rm generate-subtheme.sh
fi
