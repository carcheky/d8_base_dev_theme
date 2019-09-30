# LAYOUT_BUILDER_STYLES
``drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_builder_styles -y``

✅ PROS:
-  Permite añadir clases a secciones desde interfaz
-  Permite añadir clases a bloques desde interfaz
-  Estas clases se pueden exportar/importar con archivos de configuración

❌ CONTRAS
-  Hay que tocar código para estilar en cualquier caso
-  El proceso de creación de clases es mucho mas lento (cuando no son importadas)
-  Si alguna clase existe previamente, dará error al instalar el tema (si son importadas)
-  Implica desarrollar un módulo extra [según indica su desarrollador](https://www.drupal.org/docs/8/api/layout-api/how-to-register-layouts#using-class-key)
-  El tiempo total requerido para empezar a trabajar es mayor

# LAYOUT_SECTION_CLASSES
``drush en admin_toolbar layout_builder layout_discovery config_direct_save layout_section_classes -y``

✅ PROS:
-  No utiliza configuración adicional para definir los estilos / clases que los usuarios pueden seleccionar.
-  No implica desarrollar un módulo extra
-  Permite añadir clases a secciones desde código, la creación de nuevas clases es istantánea (duplicar/renombrar una línea)
-  No funcionará si un diseño ya ha proporcionado su propia clase de complemento personalizada.
-  El tiempo total requerido para empezar a trabajar es menor

❌ CONTRAS:
-  Hay que tocar código para estilar en cualquier caso
-  No proporciona ninguna función para sugerencias de plantillas de bloque.
-  Hay que tocar código para crear clases
-  No permite añadir clases a bloques*
-  Las clases se definen en druparcheky_theme.layouts.yml

*(esto no lo considero necesario, ya que desde el .theme estamos generando clases personalizadas por defecto, usando el título del bloque se pueden generar las clases necesarias)

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
