#!/bin/bash
# vars
ORIGINAL_DIR=$(pwd)
sudo apt install rename -y
sudo apt autoremove
# functions
generate_theme() {

  # echo ${ORIGINAL_DIR}
  echo "===================================================================="
  echo "===================================================================="
  # echo "=> OLD theme ${ORIGINAL_DIR}"
  echo "=> NEW theme in ${NEW_DIR}"
  echo "===================================================================="
  echo "===================================================================="

  cd ${NEW_DIR}
  sudo rm -fr .git
  rename "s/^fmsantiago2/$THEME_NAME/" fmsantiago2*
  mv $THEME_NAME.info.yml.example $THEME_NAME.info.yml

  # cd ${NEW_DIR}/config/install/
  # rename "s/^fmsantiago2/$THEME_NAME/" fmsantiago2*

  # cd ${NEW_DIR}
  # ls -Rla | grep $THEME_NAME

  find ${NEW_DIR} -type f -print0 | xargs -0 sed -i "s/fmsantiago2/$THEME_NAME/g"
  # find ${NEW_DIR} -type f -exec cat {} \; | grep $THEME_NAME

}
# logic

if [ ! $1 ]; then
  echo "nombre del tema:"
  read THEME_NAME
  THEME_NAME=${THEME_NAME}
fi

if [ $1 ]; then
  THEME_NAME=${1}
fi
if [ ! -d ../../../custom/${THEME_NAME} ]; then
  mkdir ../../../custom
fi

if [ -d ../../../custom/${THEME_NAME} ]; then
  echo "=> ya existe ${THEME_NAME}, borrando..."
  rm -fr ../../../custom/${THEME_NAME}
fi
if [ ! -d ../../../custom/${THEME_NAME} ]; then
  echo "=> creando ${THEME_NAME}"
  cp -fr ${ORIGINAL_DIR} ../../../custom/${THEME_NAME}
  NEW_DIR=$(
    cd ../../../custom/${THEME_NAME}
    rm generate-subtheme.sh
    pwd
  )
  generate_theme
fi

