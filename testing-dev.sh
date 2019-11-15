#!/bin/bash

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

drimport() {
  drush sql-drop -y
  drush sql-cli -v <database.sql
}

enable_modules() {
  drush -y en admin_toolbar devel module_filter fontawesome
  drush -y en config_direct_save config_split
  drush -y en layout_section_classes layout_builder_styles
}

enable_bartik() {
  drush -y en bartik
  drush -y config-set system.theme default bartik
  drush -y pmu ilutheme ilutheme
}

enable_ilutheme() {
  drush -y en ilutheme
  drush -y config-set system.theme default ilutheme
  drush -y pmu bartik
}
enable_druparcheky_theme() {
  drush -y en druparcheky_theme
  drush -y config-set system.theme default druparcheky_theme
  drush -y pmu ilutheme bartik
}

#! LOGIC
rm -fr /mnt/c/wsl/sites/devmodules/sites/default/files/php
# composer_require
# zero_install_en
# zero_install_es
drimport
# enable_modules
# enable_bartik
# enable_ilutheme
enable_druparcheky_theme
drush cr
curl http://devmodules.local | grep /themes/custom/druparcheky_theme/
# drush cron 2>/dev/null
# cmd.exe /C start http://devmodules.local
echo "listo."
