# druparcheky_theme

NEED UPDATE!!!!























## ONE LINE SCRIPT
````bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/carcheky/druparcheky_theme/master/generate-subtheme-onelinescript.sh)"
````

## Instrucciones

1. Descarga el repositorio
2. Borra la carpeta .git
3. Renombra carpetas, archivos, y contenido de archivos para renombrar el tema (busca&reemplaza druparcheky_theme)
4. Abre Visual Studio Code desde druparcheky_theme.code-workspace
5. Lee el contenido de la carpeta DOCS
6. BORRA LOS SCRIPTS ANTES DE SUBIR A PRE/PROD !!!

## VARIABLES TWIG DISPONIBLES

- {{ language }} - Devuelve el código de idioma correspondiente. Por defecto añadico como clase al body como 'lang-es'
- {{ nid }} - Devuelve el id del nodo. Por defecto aplicado al body como 'page-1'

## ARCHIVOS MODIFICABLES

- Carpeta SCSS (archivos css compilados)
- Carpeta templates (plantillas twig)
- Archivo js/global.js (js)
- druparcheky_theme.info.yml (añadir o quitar regiones)
- druparcheky_theme.theme (funciones del tema)
- druparcheky_theme.layouts.yml (añadir o quitar clases por defecto al layout_advanced)
- druparcheky_theme.libraries.yml (añadir o quitar hojas de estilos css o librerías js)

o si tienes terminal linux, ejecuta (necesita el paquete 'rename' para funcionar)

```bash
bash generate-subtheme NEW_THEME_NAME
```
