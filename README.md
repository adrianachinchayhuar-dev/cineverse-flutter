# CineVerse · Laboratorio Flutter S09–S10

Aplicación de catálogo de cine con diseño móvil vertical, fondo negro y acentos rojos. Incluye 20 títulos de cine abierto, clásicos y episodios de series de cortos. Se reutilizó el proyecto existente; no tiene reproducción de video, autenticación, backend, APIs de películas ni paquetes adicionales de ejecución.

## Ejecutar

```sh
flutter pub get
flutter run -d chrome
```

Si la conexión con el depurador de Chrome falla en el equipo:

```sh
flutter run -d chrome --release
```

Para inspeccionar la compilación local sin depurador:

```sh
flutter build web
dart tools/preview.dart
```

Abrir http://127.0.0.1:7362/ . `preview.dart` es únicamente un servidor estático de desarrollo ligado a localhost; no es un backend de la aplicación. En escritorio la interfaz conserva un ancho máximo de 480 px.


## Pantallas y funcionalidades

- **Bienvenida:** collage de pósteres, degradado, mensaje de entrada y aparición con AnimatedOpacity. El botón usa pushReplacementNamed para entrar al catálogo sin acumular bienvenidas.
- **Inicio:** portada panorámica; detalles y favoritos; filtros Todo/Películas/Series y acceso a categorías. Solo muestra Tendencias, Top 10, Acción, Comedia y Recomendadas. Las secciones sin resultados para el tipo elegido se omiten.
- **Explorar:** búsqueda por título, ignorando mayúsculas y tildes; se combina con el género seleccionado. Incluye limpiar búsqueda, resultados vacíos y accesos a Acción, Comedia, Drama, Terror, Ciencia ficción, Animación y Aventura (se conservó el género de la primera versión).
- **Categoría:** una sola pantalla parametrizada sirve para cualquier género o selección editorial. Cada ListTile abre el detalle y permite regresar al listado anterior.
- **Tendencias:** selección editorial y ranking completo de diez títulos, independiente del filtro de Inicio. Los números 1–10 se superponen parcialmente a los pósteres.
- **Detalle:** panorámica con degradado, título, año, género, duración, sinopsis, reparto/personajes, favoritos, procedencia y relacionados. Una sugerencia reemplaza el detalle actual para evitar una pila interminable de detalles.
- **Mi lista:** estado vacío, acceso a Explorar, películas guardadas y eliminación. El estado vive durante la ejecución; recargar o cerrar reinicia los favoritos.

## Dónde se demuestra cada requisito académico

| Requisito | Archivo / uso real |
|---|---|
| MaterialApp, rutas, ThemeData | lib/main.dart: tema global negro/rojo, Roboto y rutas `/` y `/catalogo`. |
| Scaffold y AppBar | Bienvenida, pantalla principal, categoría y detalle. |
| ListView | Inicio, Explorar, Tendencias, Mi lista y detalle. |
| ListView.builder | FilaCatalogo horizontal en widgets/pelicula_widgets.dart y listado vertical de screens/categoria.dart. |
| ListTile | FichaLista para películas; categorías visuales en Explorar. |
| List y Map | data/peliculas.dart: List<Map<String, dynamic>>, listas de géneros e identificadores de tendencias/ranking/recomendadas. |
| Card | TarjetaPelicula, FichaLista y tarjetas de géneros. |
| Navigator | Entrada con pushReplacementNamed; categoría/detalle con push y MaterialPageRoute; regreso con pop; relacionados con pushReplacement. |
| Column, Row, Container, Stack, Positioned, ClipRRect | Collage de bienvenida, portada, pósteres, banners, numeración del ranking y estados vacíos. |
| StatefulWidget y setState | Estado de búsqueda, filtros, pestañas y favoritos. Se comparte una lista de identificadores y callbacks, sin gestores externos. |
| AnimatedOpacity | Entrada del texto y botón en bienvenida. |
| AnimatedContainer | Respuesta sutil al pulsar las tarjetas. |
| AnimatedSwitcher | Cambio de portada, pestañas e icono de favorito. No hay carrusel automático. |
| Image.asset | Pósteres 1–10, banners y panorámicas locales, más respaldos de imágenes remotas. |
| Image.network y errorBuilder | Pósteres 11–20. Si la descarga falla aparece el respaldo local con un icono cloud_off; si también falla ese archivo aparece broken_image. |
| Poppins | Títulos, identidad y encabezados, con TextStyle(fontFamily: 'Poppins'). |
| Roboto | Fuente global y sinopsis explícita, con TextStyle(fontFamily: 'Roboto'). |
| Jacquard | “El cine nos encuentra” en bienvenida y pequeñas frases decorativas en Inicio/detalle. Nunca en párrafos extensos. |

## Archivos de la implementación

- Modificados: lib/main.dart, lib/data/peliculas.dart, lib/screens/principal.dart, lib/screens/detalle.dart y lib/widgets/pelicula_widgets.dart.
- Nuevos: lib/screens/bienvenida.dart y lib/screens/categoria.dart.
- Ajustados: pubspec.yaml, web/index.html y web/manifest.json.
- Pruebas: test/widget_test.dart reemplaza el recorrido anterior con seis pruebas ampliadas.
- Recursos/documentación: assets/images/cinema/, assets/FUENTES.md, tools/media.json, tools/classics-credits.json y este README.
- Herramienta opcional: tools/preview.dart sirve solo para la vista previa estática local.

## Imágenes locales y remotas

Se incluyen todos los recursos necesarios. No debes agregar manualmente imágenes ni fuentes.

| Carga principal del póster | Títulos |
|---|---|
| Local, Image.asset | Charge, Sprite Fright, Wing It!, Spring, Agent 327, Tears of Steel, Sintel, Big Buck Bunny, Singularity y Elephants Dream. |
| Remota, Image.network | Cosmos Laundromat, Glass Half, Hero, Coffee Run, The Daily Dweebs, Caminandes: Llamigos, Caminandes: Gran Dillama, The General, Sherlock Jr. y The Kid. |

Cada título tiene un póster diferente. Los banners son imágenes horizontales distintas de los pósteres; las películas de Blender tienen además panorámicas propias para portada/detalle. Los tres clásicos reutilizan su fotograma horizontal en el detalle, sin usar su póster vertical como banner. Las imágenes se ajustan con BoxFit.cover y no se estiran: los recortes preservan las proporciones originales.

Los archivos principales están en assets/images/cinema. El catálogo distingue `imagen`, `banner` y `portada`. Las fuentes TTF y sus licencias OFL se conservaron en assets/fonts y sus tres familias siguen declaradas en pubspec.yaml.

La procedencia, autoría, licencia y URLs directas se documentan en [assets/FUENTES.md](assets/FUENTES.md); los manifiestos tools/media.json y tools/classics-credits.json permiten identificar cada archivo. También se puede abrir “Fuentes y licencia” dentro del detalle.

## Validación automatizada

- flutter pub get: correcto.
- flutter analyze: sin incidencias.
- flutter test: seis pruebas aprobadas. Tres realizan el recorrido completo a 360 × 800, 390 × 844 y 412 × 915. Comprueban entrada, favoritos desde portada/detalle, créditos, relacionados, regreso, categorías, búsqueda combinada, vacío, pestañas y filtro de series.
- Otra prueba valida 20 identificadores únicos, ranking de diez, mínimo de cinco imágenes locales/remotas y decodificación de todos los archivos usados como póster, banner y portada.
- La prueba de red fuerza el fallo HTTP que simula flutter_test y comprueba el respaldo local. Las pruebas de widgets no certifican descargas de Internet: su cliente HTTP está bloqueado por diseño.
- flutter build web: compilación completada correctamente en la revisión de continuidad.

## Alcance del catálogo

Tendencias, recomendaciones y ranking son selecciones locales de demostración, no datos de audiencia reales. Las duraciones marcadas con ≈ son orientativas y pueden variar según el montaje; Singularity se identifica como Cortometraje sin inventar su duración. Para títulos animados sin diálogos se muestran personajes en vez de inventar un reparto de voces. Caminandes se presenta como serie de cortos; The Daily Dweebs es un piloto. Terror tiene un único título en esta selección pequeña.

Las URLs remotas se verificaron al incorporar los recursos, pero su disponibilidad futura depende del servidor de origen. Las copias locales permiten seguir explorando si falla la conexión.

## Revisión de continuidad · 31 de octubre de 2026

Se inspeccionó el estado guardado sin rediseñar ni modificar lib, test, pubspec o web. Esta carpeta no contiene repositorio Git, por lo que no se puede obtener un diff ni un estado de cambios versionados. No se puede determinar desde el disco si un editor mantiene cambios sin guardar.

Validaciones repetidas sobre el código actual:

- `flutter analyze`: No issues found.
- `flutter test`: seis pruebas aprobadas (tres recorridos móviles, recarga de ruta web sin historial duplicado, integridad del catálogo/decodificación de imágenes y respaldo ante fallo HTTP).
- `flutter build web`: Built build/web. El compilador emitió una advertencia sobre CupertinoIcons; el análisis no detectó incidencias y el código de lib no utiliza esos iconos. No se añadió una dependencia para silenciarla.

Se inspeccionaron las cuatro capturas guardadas de bienvenida e Inicio a 390 × 844 y 412 × 915. No se observaron desbordamientos en esas imágenes. Son evidencias de la sesión anterior, no capturas nuevas de esta compilación. El Inicio a 390 contiene un tooltip visible.

La revisión interactiva nueva en navegador no pudo ejecutarse: la herramienta indicó “Local browser use is disabled in Work settings”. Por tanto, no se certifica una revisión visual nueva en Chrome ni una matriz visual completa de todas las pantallas. Los recorridos a 360 × 800, 390 × 844 y 412 × 915 sí se ejecutaron como pruebas automatizadas de widgets.

Se detectaron los servidores previos de Flutter release (puerto 7361) y vista previa estática (7362), además de Chrome lanzado por Flutter. No se detectó un servidor escuchando en 7360. Se conservaron los procesos de vista previa; no fue necesario cerrarlos para analizar, probar o compilar. No se cerraron ventanas personales de Chrome ni el daemon del editor.

Las evidencias y el recorrido visual pendiente están organizados en [docs/VALIDACION.md](docs/VALIDACION.md). Para cerrar la revisión visual, habilitar el uso del navegador local o ejecutar manualmente el recorrido allí descrito.
