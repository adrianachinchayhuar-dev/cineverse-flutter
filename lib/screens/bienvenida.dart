import 'package:flutter/material.dart';
import '../data/peliculas.dart';
import '../widgets/pelicula_widgets.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({super.key});
  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  bool visible = false;
  @override
  void initState() {
    super.initState();
    // Se anima después del primer cuadro; no hay temporizadores ni paquetes.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => visible = true);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: LayoutBuilder(
      builder: (context, limites) => Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -35,
            left: -45,
            right: -45,
            height: limites.maxHeight * .8,
            child: Transform.rotate(
              angle: -.12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  3,
                  (columna) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 7,
                        right: 7,
                        top: columna == 1 ? 50 : 0,
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: List.generate(
                            3,
                            (fila) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: AspectRatio(
                                  aspectRatio: 2 / 3,
                                  child: ImagenPelicula(
                                    pelicula:
                                        peliculas[(columna * 3 + fila) %
                                            peliculas.length],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66000000),
                  Color(0x22000000),
                  Color(0xF5000000),
                  Colors.black,
                ],
                stops: [0, .28, .63, .9],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      limites.maxHeight -
                      MediaQuery.paddingOf(context).vertical,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MarcaCineVerse(),
                      Padding(
                        padding: EdgeInsets.only(top: limites.maxHeight * .41),
                        child: AnimatedOpacity(
                          opacity: visible ? 1 : 0,
                          duration: const Duration(milliseconds: 550),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'GRANDES HISTORIAS. A TU MANERA.',
                                style: TextStyle(
                                  color: rojoCine,
                                  letterSpacing: 1.8,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Tus historias favoritas, en un solo lugar',
                                style: estiloTitulo.copyWith(
                                  fontSize: 31,
                                  height: 1.15,
                                  letterSpacing: -.8,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Descubre películas, series y mucho más',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white60,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 26),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton.icon(
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/catalogo',
                                      ),
                                  label: const Text('Explorar películas'),
                                  icon: const Icon(Icons.arrow_forward_rounded),
                                  iconAlignment: IconAlignment.end,
                                ),
                              ),
                              const SizedBox(height: 18),
                              const Center(
                                child: Text(
                                  'El cine nos encuentra',
                                  style: TextStyle(
                                    fontFamily: 'Jacquard',
                                    fontSize: 24,
                                    color: Colors.white38,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
