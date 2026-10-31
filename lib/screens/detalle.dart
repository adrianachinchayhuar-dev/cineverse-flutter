import 'package:flutter/material.dart';
import '../data/peliculas.dart';
import '../widgets/pelicula_widgets.dart';

class DetallePelicula extends StatefulWidget {
  const DetallePelicula({
    super.key,
    required this.pelicula,
    required this.miLista,
    required this.onCambio,
  });
  final Map<String, dynamic> pelicula;
  final List<int> miLista;
  final VoidCallback onCambio;
  @override
  State<DetallePelicula> createState() => _DetallePeliculaState();
}

class _DetallePeliculaState extends State<DetallePelicula> {
  void alternar() {
    final id = widget.pelicula['id'] as int;
    setState(
      () => widget.miLista.contains(id)
          ? widget.miLista.remove(id)
          : widget.miLista.add(id),
    );
    widget.onCambio();
  }

  @override
  Widget build(BuildContext context) {
    final pelicula = widget.pelicula;
    final guardada = widget.miLista.contains(pelicula['id']);
    final relacionadas = peliculas
        .where(
          (p) =>
              p['id'] != pelicula['id'] &&
              (p['generos'] as List<String>).any(
                (g) => (pelicula['generos'] as List<String>).contains(g),
              ),
        )
        .take(6)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'La historia detrás',
          style: estiloTitulo.copyWith(fontSize: 16),
        ),
        leading: IconButton(
          tooltip: 'Volver',
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImagenPelicula(pelicula: pelicula, campo: 'portada'),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                      stops: [.4, 1],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 8,
                  child: Text(
                    'CINEVERSE  /  ${pelicula['tipo'].toString().toUpperCase()}',
                    style: const TextStyle(
                      color: rojoCine,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pelicula['titulo'] as String,
                  style: estiloTitulo.copyWith(
                    fontSize: 30,
                    height: 1.15,
                    letterSpacing: -.8,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  children: [
                    Text(
                      '${pelicula['anio']}',
                      style: const TextStyle(color: Colors.white60),
                    ),
                    Text(
                      pelicula['duracion'] as String,
                      style: const TextStyle(color: Colors.white60),
                    ),
                    Text(
                      pelicula['genero'] as String,
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    key: const Key('favorito-detalle'),
                    onPressed: alternar,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 180),
                      child: Icon(
                        guardada ? Icons.check : Icons.add,
                        key: ValueKey(guardada),
                      ),
                    ),
                    label: Text(
                      guardada ? 'Quitar de Mi lista' : 'Agregar a Mi lista',
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                Text('Sinopsis', style: estiloTitulo.copyWith(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  pelicula['descripcion'] as String,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    height: 1.75,
                    color: Color(0xFFB8B8C0),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'Reparto y personajes',
                  style: estiloTitulo.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  pelicula['reparto'] as String,
                  style: const TextStyle(color: Colors.white60, height: 1.7),
                ),
                const SizedBox(height: 22),
                Text(
                  pelicula['credito'] as String,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 10,
                    height: 1.6,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Créditos de las imágenes',
                              style: estiloTitulo.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 16),
                            SelectableText(
                              '${pelicula['credito']}\n\nFuente:\n${pelicula['fuente']}\n\nRecursos recortados para adaptar su proporción. Documentación completa en assets/FUENTES.md.',
                              style: const TextStyle(height: 1.7),
                            ),
                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cerrar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.copyright, size: 15),
                  label: const Text(
                    'Fuentes y licencia',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          FilaCatalogo(
            titulo: 'También te puede gustar',
            lista: relacionadas,
            onAbrir: (otra) {
              // Reemplazar evita acumular detalles al recorrer los relacionados.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  settings: RouteSettings(name: '/detalle/${otra['id']}'),
                  builder: (context) => DetallePelicula(
                    pelicula: otra,
                    miLista: widget.miLista,
                    onCambio: widget.onCambio,
                  ),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 30),
            child: Text(
              'Cada historia deja una huella',
              style: TextStyle(
                fontFamily: 'Jacquard',
                fontSize: 25,
                color: Colors.white38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
