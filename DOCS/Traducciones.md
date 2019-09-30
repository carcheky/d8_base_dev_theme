# Traducciones en Drupal
Muy importante!

Existe un bug a la hora de crear los bloques en drupal 8.
Como norma, los bloques personalizados aparecerán en [/admin/structure/block/block-content](/admin/structure/block/block-content), donde se pueden editar y traducir posteriormente.
Esto no sucede así cuando los bloques son creados directamente en el layout builder.

Consecuencia: Estos bloques no serán traducibles.
Solución: Todos los bloques deben ser creados vía [/admin/structure/block/block-content](/admin/structure/block/block-content), y luego incrustados en el layout builder.
