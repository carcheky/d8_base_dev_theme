#!/bin/bash
# vars
ORIGINAL_DIR=$(pwd);
# functions

# logic

if [ ! $1 ] ; then
  echo "nombre del tema:"
  read ${THEME_NAME}
  THEME_NAME=${THEME_NAME}
fi

if [ $1 ] ; then
  THEME_NAME=${1}
fi

rm -fr ../${THEME_NAME}
cp -fr ${ORIGINAL_DIR} ../${THEME_NAME}

NEW_DIR=$(cd ../${THEME_NAME}; pwd)
# echo ${ORIGINAL_DIR}
echo "===================================================================="
echo "===================================================================="
echo "=> OLD theme ${ORIGINAL_DIR}"
echo "=> NEW theme ${NEW_DIR}"
echo "===================================================================="
echo "===================================================================="

cd ${NEW_DIR}
rename "s/^themerepo/$THEME_NAME/" themerepo*
cd ${NEW_DIR}/config/install/
rename "s/^themerepo/$THEME_NAME/" themerepo*
cd ${NEW_DIR}
ls -Rla | grep $THEME_NAME

find ${NEW_DIR} -type f -print0 | xargs -0 sed -i "s/themerepo/$THEME_NAME/g"
find ${NEW_DIR} -type f -exec cat {} \; | grep $THEME_NAME
