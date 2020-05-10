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
  rename "s/^druparcheky_theme/$THEME_NAME/" druparcheky_theme*

  cd ${NEW_DIR}/config/install/
  rename "s/^druparcheky_theme/$THEME_NAME/" druparcheky_theme*

  # cd ${NEW_DIR}
  # ls -Rla | grep $THEME_NAME

  find ${NEW_DIR} -type f -print0 | xargs -0 sed -i "s/druparcheky_theme/$THEME_NAME/g"
  # find ${NEW_DIR} -type f -exec cat {} \; | grep $THEME_NAME

}
# logic


git clone https://github.com/carcheky/druparcheky_theme.git druparcheky_tmp
rm -fr druparcheky_tmp/.git
cd druparcheky_tmp/

if [ ! $1 ]; then
  echo "nombre del tema:"
  read THEME_NAME
  THEME_NAME=${THEME_NAME}
fi

if [ $1 ]; then
  THEME_NAME=${1}
fi
if [ -d ../${THEME_NAME} ]; then
  echo "=> ya existe ${THEME_NAME}, borrando..."
  rm -fr ../${THEME_NAME}
fi
if [ ! -d ../${THEME_NAME} ]; then
  echo "=> creando ${THEME_NAME}"
  cp -fr ${ORIGINAL_DIR} ../${THEME_NAME}
  NEW_DIR=$(
    cd ../${THEME_NAME}
    pwd
  )
  generate_theme
fi
cd ${ORIGINAL_DIR}
rm -fr druparcheky_tmp

