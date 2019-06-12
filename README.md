# d8_base_dev_theme

1. Download repo
2. Rename 'themerepo' folder and move to destination
3. Remame files
4. Rename 'themerepo.info.yml' file (you can customize this file)
5. Rename 'themerepo.XXX.XXX' files
6. Search & replace "themerepo" to "yourthemename" in all files
7. Install && enable
8. Open [Prepros](https://prepros.io) and style! (or 'install live sass compiler' in vscode, you )

or run

```
bash generate-subtheme
```

## Thanks

- https://github.com/7ninjas/scss-mixins

`````

    "liveSassCompile.settings.formats": [ // This is Default.
        {
            "format": "expanded",
            "extensionName": ".css",
            "savePath": "~/../css/"
        },
    ],
    "liveSassCompile.settings.generateMap": true,
    "liveSassCompile.settings.autoprefix": [
        "> 1%",
        "last 5 versions"
    ],
    ````
`````
