#!/bin/bash
# drush -y en bartik
# drush -y config-set system.theme default bartik
# drush -y pmu ilutheme
rm -fr ../ilutheme

# composer require drupal/admin_toolbar drupal/config_direct_save drupal/layout_section_classes drupal/layout_builder_styles
# composer update --with-dependencies

# # AUTOINSTALACIÓN ES
drush si druparcheky --account-pass=admin --site-name=devmodules --locale=es -y

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

bash generate-subtheme.sh ilutheme
drush cr
drush cron
drush -y en ilutheme
drush -y config-set system.theme default ilutheme
drush -y pmu bartik

cmd.exe /C start http://devmodules.local/user
echo "listo."
