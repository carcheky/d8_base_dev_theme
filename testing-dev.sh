#!/bin/bash


# composer require drupal/admin_toolbar drupal/config_direct_save drupal/layout_section_classes drupal/layout_builder_styles
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


zero_install_es(){
sudo rm -fr /mnt/c/wsl/sites/devmodules/web/vendor
sudo rm -fr /mnt/c/wsl/sites/devmodules/web/core
sudo rm -fr /mnt/c/wsl/sites/devmodules/web/composer.lock

composer require drupal/admin_toolbar drupal/config_direct_save drupal/config_split drupal/layout_section_classes drupal/layout_builder_styles
composer update --with-dependencies

drush si druparcheky --account-pass=admin --site-name=devmodules --locale=es -yvvv
drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes layout_builder_styles -y
drush -y en druparcheky_theme
drush -y config-set system.theme default druparcheky_theme
drush -y pmu bartik
drush cron
}











# zero_install_es
drush cr

# cmd.exe /C start http://devmodules.local
echo "listo."
