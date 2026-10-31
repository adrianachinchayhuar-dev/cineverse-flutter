import 'package:flutter/material.dart';
import '../data/peliculas.dart';
import '../widgets/pelicula_widgets.dart';
import 'categoria.dart';
import 'detalle.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});
  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int pestana = 0;
  String tipo = 'Todos';
  String categoria = 'Todas';
  String consulta = '';
  final buscador = TextEditingController();
  // Única lista compartida con detalle y categorías; sin almacenamiento permanente.
  final List<int> miLista = [];

  @override
  void dispose() {
    buscador.dispose();
    super.dispose();
  }

  void actualizar() {
    if (mounted) setState(() {});
  }

  void alternar(Map<String, dynamic> pelicula) {
    final id = pelicula['id'] as int;
    setState(() => miLista.contains(id) ? miLista.remove(id) : miLista.add(id));
  }

  void abrirDetalle(Map<String, dynamic> pelicula) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        settings: RouteSettings(name: '/detalle/${pelicula['id']}'),
        builder: (context) => DetallePelicula(
          pelicula: pelicula,
          miLista: miLista,
          onCambio: actualizar,
        ),
      ),
    );
  }

  void abrirCategoria(String nombre, List<Map<String, dynamic>> lista) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        settings: RouteSettings(name: '/categoria/$nombre'),
        builder: (context) => PantallaCategoria(
          titulo: nombre,
          lista: lista,
          onAbrir: abrirDetalle,
        ),
      ),
    );
  }

  List<Map<String, dynamic>> porTipo(List<Map<String, dynamic>> lista) =>
      lista.where((p) => tipo == 'Todos' || p['tipo'] == tipo).toList();
  List<Map<String, dynamic>> porGenero(String genero) => peliculas
      .where((p) => (p['generos'] as List<String>).contains(genero))
      .toList();

  Widget encabezado(String texto, String subtitulo) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          texto,
          style: estiloTitulo.copyWith(
            fontSize: 28,
            height: 1.2,
            letterSpacing: -.7,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitulo,
          style: const TextStyle(color: Colors.white54, height: 1.6),
        ),
      ],
    ),
  );

  Widget portada(Map<String, dynamic> destacada) => Padding(
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 420,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ImagenPelicula(pelicula: destacada, campo: 'portada'),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x11000000),
                    Color(0x33000000),
                    Color(0xFF000000),
                  ],
                  stops: [0, .35, 1],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: rojoCine,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Text(
                  'SELECCIÓN CINEVERSE',
                  style: TextStyle(
                    fontSize: 8,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'UNA HISTORIA QUE NO TE SUELTA',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white70,
                      letterSpacing: 1.8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    destacada['titulo'].toString().toUpperCase(),
                    style: estiloTitulo.copyWith(
                      fontSize: 40,
                      letterSpacing: 1,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${destacada['anio']}   ·   ${destacada['genero']}   ·   ${destacada['duracion']}',
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => abrirDetalle(destacada),
                          icon: const Icon(Icons.info_outline, size: 18),
                          label: const Text(
                            'Ver detalles',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          key: const Key('favorito-portada'),
                          onPressed: () => alternar(destacada),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.white.withValues(alpha: .1),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            side: const BorderSide(color: Colors.white24),
                          ),
                          icon: Icon(
                            miLista.contains(destacada['id'])
                                ? Icons.check
                                : Icons.add,
                            size: 18,
                          ),
                          label: Text(
                            miLista.contains(destacada['id'])
                                ? 'Guardada'
                                : 'Mi lista',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget fila(
    String titulo,
    List<Map<String, dynamic>> lista, {
    bool horizontal = false,
    bool ranking = false,
  }) {
    final visibles = porTipo(lista);
    if (visibles.isEmpty) return const SizedBox.shrink();
    return FilaCatalogo(
      titulo: titulo,
      lista: visibles,
      horizontal: horizontal,
      ranking: ranking,
      onAbrir: abrirDetalle,
      onVerTodo: () => abrirCategoria(titulo, visibles),
    );
  }

  Widget inicio() {
    final destacada = porTipo(peliculas).first;
    return ListView(
      key: const PageStorageKey('inicio'),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        SizedBox(
          height: 44,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              for (final opcion in ['Todos', 'Película', 'Serie'])
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(
                      opcion == 'Película'
                          ? 'Películas'
                          : opcion == 'Serie'
                          ? 'Series'
                          : 'Todo',
                    ),
                    selected: tipo == opcion,
                    showCheckmark: false,
                    onSelected: (_) => setState(() => tipo = opcion),
                  ),
                ),
              ActionChip(
                label: const Text('Categorías'),
                avatar: const Icon(Icons.keyboard_arrow_down, size: 16),
                onPressed: () => setState(() => pestana = 1),
              ),
            ],
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: KeyedSubtree(key: ValueKey(tipo), child: portada(destacada)),
        ),
        fila('Tendencias', seleccion(tendenciasIds)),
        fila('Las 10 más populares', seleccion(topIds), ranking: true),
        fila('Acción', porGenero('Acción'), horizontal: true),
        fila('Comedia', porGenero('Comedia'), horizontal: true),
        fila('Recomendadas', seleccion(recomendadasIds)),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
          child: Text(
            'El cine nos conecta',
            style: TextStyle(
              fontFamily: 'Jacquard',
              fontSize: 26,
              color: Colors.white38,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Una selección de cine abierto y clásicos.',
            style: TextStyle(fontSize: 11, color: Colors.white38),
          ),
        ),
      ],
    );
  }

  Widget explorar() {
    // La consulta y el género se combinan. Normalizar también permite buscar sin tildes.
    final resultados = peliculas
        .where(
          (p) =>
              normalizar(
                p['titulo'] as String,
              ).contains(normalizar(consulta.trim())) &&
              (categoria == 'Todas' ||
                  (p['generos'] as List<String>).contains(categoria)),
        )
        .toList();
    return ListView(
      key: const PageStorageKey('explorar'),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        encabezado(
          'Descubre algo nuevo',
          'Una historia para cada estado de ánimo.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            key: const Key('buscador'),
            controller: buscador,
            onChanged: (valor) => setState(() => consulta = valor),
            decoration: InputDecoration(
              hintText: 'Buscar películas y series',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: consulta.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Limpiar búsqueda',
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        buscador.clear();
                        setState(() => consulta = '');
                      },
                    ),
              filled: true,
              fillColor: const Color(0xFF18181C),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 46,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              for (final genero in ['Todas', ...categorias])
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(genero),
                    selected: categoria == genero,
                    showCheckmark: false,
                    onSelected: (_) => setState(() => categoria = genero),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (consulta.isEmpty && categoria == 'Todas') ...[
                Text(
                  'Explora por género',
                  style: estiloTitulo.copyWith(fontSize: 19),
                ),
                const SizedBox(height: 14),
                for (final genero in categorias)
                  Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            coloresGenero[categorias.indexOf(genero)],
                            const Color(0xFF141416),
                          ],
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(iconosGenero[categorias.indexOf(genero)]),
                        title: Text(
                          genero,
                          style: estiloTitulo.copyWith(fontSize: 14),
                        ),
                        subtitle: Text(
                          cantidadTitulos(porGenero(genero).length),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white60,
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => abrirCategoria(genero, porGenero(genero)),
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
              ],
              Text(
                consulta.isEmpty
                    ? 'Catálogo · ${cantidadTitulos(resultados.length)}'
                    : '${resultados.length} ${resultados.length == 1 ? 'resultado' : 'resultados'}',
                style: estiloTitulo.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 16),
              if (resultados.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Icon(Icons.search_off, size: 44, color: Colors.white38),
                      SizedBox(height: 12),
                      Text('No encontramos esa historia', style: estiloTitulo),
                      SizedBox(height: 8),
                      Text(
                        'Prueba otro título o cambia el género.',
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ...resultados.map(
                (p) => FichaLista(pelicula: p, onTap: () => abrirDetalle(p)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tendencias() => ListView(
    key: const PageStorageKey('tendencias'),
    children: [
      encabezado('En el radar', 'Nuestra selección para descubrir hoy.'),
      FilaCatalogo(
        titulo: 'Tendencias',
        lista: seleccion(tendenciasIds),
        onAbrir: abrirDetalle,
        onVerTodo: () => abrirCategoria('Tendencias', seleccion(tendenciasIds)),
      ),
      FilaCatalogo(
        titulo: 'Las 10 más populares',
        lista: seleccion(topIds),
        ranking: true,
        onAbrir: abrirDetalle,
        onVerTodo: () =>
            abrirCategoria('Las 10 más populares', seleccion(topIds)),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Selección y ranking de demostración. No representan estadísticas de audiencia.',
          style: TextStyle(fontSize: 11, color: Colors.white38),
        ),
      ),
    ],
  );

  Widget guardadas() {
    final lista = peliculas.where((p) => miLista.contains(p['id'])).toList();
    return ListView(
      key: const PageStorageKey('mi-lista'),
      children: [
        encabezado(
          'Mi lista',
          '${lista.length} ${lista.length == 1 ? 'historia' : 'historias'} que quieres descubrir.',
        ),
        if (lista.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 40, 28, 24),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: rojoCine.withValues(alpha: .1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bookmark_add_outlined,
                    size: 48,
                    color: rojoCine,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Tu próxima historia te espera',
                  textAlign: TextAlign.center,
                  style: estiloTitulo.copyWith(fontSize: 22, height: 1.3),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Guarda tus favoritas y tenlas siempre a mano durante esta visita.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, height: 1.7),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () => setState(() => pestana = 1),
                  child: const Text('Descubrir títulos'),
                ),
              ],
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: lista
                  .map(
                    (p) => FichaLista(
                      pelicula: p,
                      onTap: () => abrirDetalle(p),
                      onQuitar: () => alternar(p),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const MarcaCineVerse(),
      actions: [
        IconButton(
          tooltip: 'Buscar en el catálogo',
          onPressed: () => setState(() => pestana = 1),
          icon: const Icon(Icons.search, size: 24),
        ),
        const SizedBox(width: 8),
      ],
    ),
    body: SafeArea(
      top: false,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        child: KeyedSubtree(
          key: ValueKey(pestana),
          child: [inicio, explorar, tendencias, guardadas][pestana](),
        ),
      ),
    ),
    bottomNavigationBar: NavigationBar(
      height: 68,
      selectedIndex: pestana,
      backgroundColor: const Color(0xFF101012),
      indicatorColor: rojoCine.withValues(alpha: .18),
      onDestinationSelected: (index) => setState(() => pestana = index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: rojoCine),
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore, color: rojoCine),
          label: 'Explorar',
        ),
        NavigationDestination(
          icon: Icon(Icons.local_fire_department_outlined),
          selectedIcon: Icon(Icons.local_fire_department, color: rojoCine),
          label: 'Tendencias',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_border),
          selectedIcon: Icon(Icons.bookmark, color: rojoCine),
          label: 'Mi lista',
        ),
      ],
    ),
  );
}

const coloresGenero = [
  Color(0xFF482022),
  Color(0xFF4A3520),
  Color(0xFF243547),
  Color(0xFF382040),
  Color(0xFF193C45),
  Color(0xFF40325A),
  Color(0xFF29402A),
];
const iconosGenero = [
  Icons.bolt,
  Icons.sentiment_satisfied_alt,
  Icons.theater_comedy_outlined,
  Icons.nights_stay_outlined,
  Icons.rocket_launch_outlined,
  Icons.auto_awesome,
  Icons.landscape_outlined,
];
