# LAYOUT_BUILDER_STYLES
``drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_builder_styles -y``

✅ PROS:
-  Permite añadir clases a secciones desde interfaz
-  Permite añadir clases a secciones desde interfaz
-  Estas clases se pueden exportar/importar con archivos de configuración

❌ CONTRAS
-  Hay que tocar código para estilar en cualquier caso
-  El proceso de creación de clases es mucho mas lento (cuando no son importadas)
-  Las clases sólo funcionan si el layout concreto ya tiene alguna configuración previa
-  Si alguna clase existe previamente, dará error al instalar el tema


# LAYOUT_SECTION_CLASSES
``drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes -y``

✅ PROS:
-  Permite añadir clases a secciones desde código
-  No necesita que el layout tenga configuraciones previas
-  La creación de nuevas clases es istantánea (duplicar/renombrar una línea)
-  Instalar y maquetar

❌ CONTRAS:
-  Hay que tocar código para estilar en cualquier caso
-  Hay que tocar código para crear clases
-  No permite añadir clases a bloques*
-  Las clases se definen en druparcheky_theme.layouts.yml


# DOS MÓDULOS ATIVOS
``drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes layout_builder_styles -y``

✅ PROS:
-  builder_styles funciona en todas las secciones gracias a que section_classes aporta la interfaz de configuracion
-  builder_styles funciona en todos los bloques
-  Permite añadir clases a secciones desde interfaz
-  Permite añadir clases a secciones desde codigo
-  Permite añadir clases a bloques desde interfaz

❌ CONTRAS:
-  Dos módulos beta activos
-  Hay que tocar el código en cualquiera de los casos
-  Añadir una clase desde interfaz sigue siendo mucho mas lento que añadir una línea a druparcheky_theme.layouts.yml




*(esto no lo considero necesario, ya que desde el .theme estamos generando clases personalizadas por defecto, usando el título del bloque se pueden generar las clases necesarias)
