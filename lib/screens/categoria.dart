import 'package:flutter/material.dart';
import '../widgets/pelicula_widgets.dart';
import '../data/peliculas.dart';

// Una sola pantalla recibe el título y la lista: no repetimos una por género.
class PantallaCategoria extends StatelessWidget {
  const PantallaCategoria({
    super.key,
    required this.titulo,
    required this.lista,
    required this.onAbrir,
  });
  final String titulo;
  final List<Map<String, dynamic>> lista;
  final void Function(Map<String, dynamic>) onAbrir;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(titulo, style: estiloTitulo.copyWith(fontSize: 19)),
    ),
    body: ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: lista.length + 1,
      itemBuilder: (context, index) => index == 0
          ? Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ENCUENTRA TU PRÓXIMA HISTORIA',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      color: rojoCine,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${cantidadTitulos(lista.length)} para descubrir',
                    style: const TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            )
          : FichaLista(
              pelicula: lista[index - 1],
              onTap: () => onAbrir(lista[index - 1]),
            ),
    ),
  );
}
