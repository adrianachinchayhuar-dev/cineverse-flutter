import 'package:flutter/material.dart';

const rojoCine = Color(0xFFE50928);
const estiloTitulo = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

class MarcaCineVerse extends StatelessWidget {
  const MarcaCineVerse({super.key});
  @override
  Widget build(BuildContext context) => const Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: 'CINE',
          style: TextStyle(color: rojoCine),
        ),
        TextSpan(text: 'VERSE'),
      ],
    ),
    style: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 23,
      letterSpacing: -1,
    ),
  );
}

class ImagenPelicula extends StatelessWidget {
  const ImagenPelicula({
    super.key,
    required this.pelicula,
    this.campo = 'imagen',
    this.fit = BoxFit.cover,
  });
  final Map<String, dynamic> pelicula;
  final String campo;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final ruta = pelicula[campo] as String;
    Widget indicador(BuildContext context, Object error, StackTrace? stack) =>
        const ColoredBox(
          color: Color(0xFF211A28),
          child: Center(
            child: Tooltip(
              message: 'Imagen no disponible',
              child: Icon(Icons.broken_image_outlined, color: Colors.white54),
            ),
          ),
        );
    // Las remotas conservan un póster local de respaldo para funcionar sin red.
    if (ruta.startsWith('https://')) {
      return Image.network(
        ruta,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        semanticLabel: 'Póster de ${pelicula['titulo']}',
        errorBuilder: (context, error, stack) => Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              pelicula['respaldo'] as String,
              fit: fit,
              errorBuilder: indicador,
            ),
            const Positioned(
              top: 6,
              right: 6,
              child: Tooltip(
                message: 'Sin conexión: imagen local de respaldo',
                child: Icon(Icons.cloud_off, size: 16, color: Colors.white70),
              ),
            ),
          ],
        ),
      );
    }
    return Image.asset(
      ruta,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      semanticLabel: 'Imagen de ${pelicula['titulo']}',
      errorBuilder: indicador,
    );
  }
}

class TarjetaPelicula extends StatefulWidget {
  const TarjetaPelicula({
    super.key,
    required this.pelicula,
    required this.onTap,
    this.horizontal = false,
    this.numero,
  });
  final Map<String, dynamic> pelicula;
  final VoidCallback onTap;
  final bool horizontal;
  final int? numero;
  @override
  State<TarjetaPelicula> createState() => _TarjetaPeliculaState();
}

class _TarjetaPeliculaState extends State<TarjetaPelicula> {
  bool pulsada = false;
  @override
  Widget build(BuildContext context) {
    final horizontal = widget.horizontal;
    final ranking = widget.numero != null;
    final ancho = horizontal
        ? 232.0
        : ranking
        ? 160.0
        : 132.0;
    return SizedBox(
      width: ancho,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          transform: Matrix4.diagonal3Values(
            pulsada ? .97 : 1,
            pulsada ? .97 : 1,
            1,
          ),
          child: Card(
            color: Colors.transparent,
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: widget.onTap,
              onHighlightChanged: (valor) => setState(() => pulsada = valor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: horizontal ? 124 : 180,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: ranking ? 26 : 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: ImagenPelicula(
                              pelicula: widget.pelicula,
                              campo: horizontal ? 'banner' : 'imagen',
                            ),
                          ),
                        ),
                        if (ranking)
                          Positioned(
                            left: 0,
                            bottom: -8,
                            child: Stack(
                              children: [
                                Text(
                                  '${widget.numero}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 80,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.white70,
                                  ),
                                ),
                                Text(
                                  '${widget.numero}',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 80,
                                    color: Color(0xFF080808),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.pelicula['tipo'] == 'Serie')
                          const Positioned(
                            top: 7,
                            left: 7,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: rojoCine,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: Text(
                                  'SERIE',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.pelicula['titulo'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: estiloTitulo.copyWith(
                      fontSize: horizontal ? 13 : 11,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.pelicula['anio']} · ${widget.pelicula['genero']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10, color: Colors.white54),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// El mismo carrusel sirve para ambos formatos y para el ranking.
class FilaCatalogo extends StatelessWidget {
  const FilaCatalogo({
    super.key,
    required this.titulo,
    required this.lista,
    required this.onAbrir,
    this.onVerTodo,
    this.horizontal = false,
    this.ranking = false,
  });
  final String titulo;
  final List<Map<String, dynamic>> lista;
  final void Function(Map<String, dynamic>) onAbrir;
  final VoidCallback? onVerTodo;
  final bool horizontal;
  final bool ranking;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(titulo, style: estiloTitulo.copyWith(fontSize: 18)),
              ),
              if (onVerTodo != null)
                IconButton(
                  tooltip: 'Ver todo: $titulo',
                  onPressed: onVerTodo,
                  icon: const Icon(Icons.chevron_right, color: Colors.white60),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: horizontal ? 196 : 254,
          child: ListView.builder(
            key: PageStorageKey('fila-$titulo'),
            padding: const EdgeInsets.only(left: 20, right: 8),
            scrollDirection: Axis.horizontal,
            itemCount: lista.length,
            itemBuilder: (context, index) => TarjetaPelicula(
              pelicula: lista[index],
              horizontal: horizontal,
              numero: ranking ? index + 1 : null,
              onTap: () => onAbrir(lista[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

class FichaLista extends StatelessWidget {
  const FichaLista({
    super.key,
    required this.pelicula,
    required this.onTap,
    this.onQuitar,
  });
  final Map<String, dynamic> pelicula;
  final VoidCallback onTap;
  final VoidCallback? onQuitar;
  @override
  Widget build(BuildContext context) => Card(
    color: const Color(0xFF151518),
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 46,
          height: 66,
          child: ImagenPelicula(pelicula: pelicula),
        ),
      ),
      title: Text(
        pelicula['titulo'] as String,
        style: estiloTitulo.copyWith(fontSize: 13),
      ),
      subtitle: Text(
        '${pelicula['anio']} · ${pelicula['genero']}\n${pelicula['tipo']} · ${pelicula['duracion']}',
        style: const TextStyle(fontSize: 11, color: Colors.white60),
      ),
      isThreeLine: true,
      trailing: onQuitar == null
          ? const Icon(Icons.chevron_right, size: 20)
          : IconButton(
              tooltip: 'Quitar ${pelicula['titulo']}',
              icon: const Icon(Icons.close),
              onPressed: onQuitar,
            ),
      onTap: onTap,
    ),
  );
}
