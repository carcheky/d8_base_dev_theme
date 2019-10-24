#!/bin/bash
# composer update --with-dependencies
# AUTOINSTALACIÓN ES
# drush si druparcheky --account-pass=admin --site-name=devmodules --locale=es -yvvv
# AUTOINSTALACIÓN EN
# drush si druparcheky --account-pass=admin --site-name=devmodules --locale=en -y
# PRUEBA CON MÓDULO LAYOUT_BUILDER_STYLES
# drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_builder_styles -y
# PRUEBA CON MÓDULO LAYOUT_SECTION_CLASSES
# drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes -y
# PRUEBA CON LOS DOS MÓDULOS ATIVOS
# drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes layout_builder_styles -y
# PRUEBA CON NINGUNO DE LOS MODULOS
# drush en admin_toolbar layout_builder layout_discovery config_direct_save -y
# drush config-set system.theme default bartik -y
# drush theme-uninstall ilutheme
# drush -y en bartik
# drush -y config-set system.theme default bartik
# # drush -y pmu ilutheme
# # rm -fr ../ilutheme
# # drush cr
# # bash generate-subtheme.sh ilutheme
# # drush -y en ilutheme
# # drush -y config-set system.theme default ilutheme
# drush -y pmu druparcheky_theme

#! FUNCTIONS

composer_require() {
  sudo rm -fr /mnt/c/wsl/sites/devmodules/web/vendor
  sudo rm -fr /mnt/c/wsl/sites/devmodules/web/core
  sudo rm -fr /mnt/c/wsl/sites/devmodules/web/*/contrib
  sudo rm -fr /mnt/c/wsl/sites/devmodules/web/composer.lock
  composer require drupal/admin_toolbar drupal/config_direct_save drupal/config_split drupal/layout_section_classes drupal/layout_builder_styles drupal/module_filter drupal/fontawesome drupal/devel
  composer update --with-dependencies
}

zero_install_en() {
  drush -y si druparcheky --account-pass=admin --site-name=devmodules --locale=en
}

zero_install_es() {
  drush -y si druparcheky --account-pass=admin --site-name=devmodules --locale=es
}

enable_modules() {
  drush -y en admin_toolbar devel module_filter fontawesome
  drush -y en config_direct_save config_split
  drush -y en layout_section_classes layout_builder_styles
}

enable_bartik() {
  drush -y en bartik
  drush -y config-set system.theme default bartik
  drush -y pmu ilutheme druparcheky_theme
}

enable_ilutheme() {
  bash generate-subtheme.sh ilutheme
  drush -y en ilutheme
  drush -y config-set system.theme default ilutheme
  drush -y pmu druparcheky_theme bartik
}

enable_druparcheky_theme() {
  drush -y en druparcheky_theme
  drush -y config-set system.theme default druparcheky_theme
  drush -y pmu ilutheme bartik
}

#! LOGIC
dos2unix *.sh
rm -fr /mnt/c/wsl/sites/devmodules/sites/default/files/php
# composer_require
# zero_install_en
# zero_install_es
# enable_modules
enable_bartik
# enable_druparcheky_theme
enable_ilutheme
drush cr
# drush cron 2>/dev/null
cmd.exe /C start http://devmodules.local
echo "listo."
