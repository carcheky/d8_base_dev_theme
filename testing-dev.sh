#!/bin/bash
rm -fr ../themerepo

# AUTOINSTALACIÓN ES
# drush si standard --account-pass=admin --site-name=themerepo --locale=es -y

# AUTOINSTALACIÓN EN
drush si standard --account-pass=admin --site-name=themerepo -y

# PRUEBA CON MÓDULO LAYOUT_BUILDER_STYLES
# drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_builder_styles -y

# PRUEBA CON MÓDULO LAYOUT_SECTION_CLASSES
# drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes -y

# PRUEBA CON LOS DOS MÓDULOS ATIVOS
drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes layout_builder_styles -y

# drush config-set system.theme default bartik -y
# drush theme-uninstall themerepo
bash generate-subtheme.sh themerepo
drush theme-enable themerepo
drush config-set system.theme default themerepo -y


cmd.exe /C start http://themerepo:8888/user
