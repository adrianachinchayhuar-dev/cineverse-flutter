import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laboratorio_flutter/main.dart';
import 'package:laboratorio_flutter/data/peliculas.dart';
import 'package:laboratorio_flutter/widgets/pelicula_widgets.dart';

void main() {
  for (final tamano in [
    const Size(360, 800),
    const Size(390, 844),
    const Size(412, 915),
  ]) {
    testWidgets('Recorrido completo móvil ${tamano.width} × ${tamano.height}', (
      tester,
    ) async {
      tester.view.physicalSize = tamano;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const CineVerseApp());
      await tester.pumpAndSettle();
      expect(
        find.text('Tus historias favoritas, en un solo lugar'),
        findsOneWidget,
      );
      await tester.ensureVisible(find.text('Explorar películas'));
      await tester.tap(find.text('Explorar películas'));
      await tester.pumpAndSettle();
      expect(find.text('Ver detalles'), findsOneWidget);
      await tester.tap(find.byKey(const Key('favorito-portada')));
      await tester.pumpAndSettle();
      expect(find.text('Guardada'), findsOneWidget);
      await tester.tap(find.text('Ver detalles'));
      await tester.pumpAndSettle();
      expect(find.text('Quitar de Mi lista'), findsOneWidget);
      expect(find.text('Sinopsis'), findsOneWidget);
      await tester.tap(find.byKey(const Key('favorito-detalle')));
      await tester.pumpAndSettle();
      expect(find.text('Agregar a Mi lista'), findsOneWidget);
      await tester.tap(find.byKey(const Key('favorito-detalle')));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Fuentes y licencia'),
        250,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.ensureVisible(find.text('Fuentes y licencia'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Fuentes y licencia'));
      await tester.pumpAndSettle();
      expect(find.text('Créditos de las imágenes'), findsOneWidget);
      await tester.tap(find.text('Cerrar'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('También te puede gustar'));
      final relacionada = find.byType(TarjetaPelicula).first;
      await tester.ensureVisible(relacionada);
      await tester.tap(relacionada);
      await tester.pumpAndSettle();
      // La sugerencia sustituye el detalle; al volver llegamos al Inicio.
      await tester.tap(find.byTooltip('Volver'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Mi lista').last);
      await tester.pumpAndSettle();
      expect(find.text('Charge'), findsOneWidget);
      await tester.tap(find.byTooltip('Quitar Charge'));
      await tester.pumpAndSettle();
      expect(find.text('Tu próxima historia te espera'), findsOneWidget);
      await tester.tap(find.text('Descubrir títulos'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ListTile, 'Acción').first);
      await tester.pumpAndSettle();
      expect(find.text('Acción'), findsOneWidget);
      await tester.tap(find.widgetWithText(ListTile, 'Charge'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Volver'));
      await tester.pumpAndSettle();
      expect(find.text('Acción'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('buscador')), 'sintel');
      await tester.pumpAndSettle();
      expect(find.text('1 resultado'), findsOneWidget);
      expect(find.widgetWithText(ListTile, 'Sintel'), findsOneWidget);
      await tester.tap(find.widgetWithText(ChoiceChip, 'Comedia'));
      await tester.pumpAndSettle();
      expect(find.text('No encontramos esa historia'), findsOneWidget);
      await tester.tap(find.byTooltip('Limpiar búsqueda'));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(ListTile, 'Sintel'), findsNothing);
      await tester.tap(find.text('Tendencias').last);
      await tester.pumpAndSettle();
      expect(find.text('En el radar'), findsOneWidget);
      await tester.tap(find.text('Inicio').last);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(ChoiceChip, 'Series'));
      await tester.pumpAndSettle();
      expect(find.text('THE DAILY DWEEBS'), findsOneWidget);
      await tester.tap(find.widgetWithText(ChoiceChip, 'Todo'));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.byTooltip('Ver todo: Acción'),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Ver todo: Acción'));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(ListTile, 'Charge'), findsOneWidget);
    });
  }

  testWidgets('Recargar una ruta web conserva una única entrada al catálogo', (
    tester,
  ) async {
    tester.binding.platformDispatcher.defaultRouteNameTestValue = '/catalogo';
    addTearDown(
      tester.binding.platformDispatcher.clearDefaultRouteNameTestValue,
    );
    await tester.pumpWidget(const CineVerseApp());
    await tester.pumpAndSettle();
    expect(
      find.text('Tus historias favoritas, en un solo lugar'),
      findsOneWidget,
    );
    await tester.ensureVisible(find.text('Explorar películas'));
    await tester.tap(find.text('Explorar películas'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsNothing);
  });

  test('Catálogo completo y archivos válidos', () async {
    expect(peliculas.length, 20);
    expect(peliculas.map((p) => p['id']).toSet().length, 20);
    expect(seleccion(topIds).length, 10);
    expect(
      peliculas
          .where((p) => (p['imagen'] as String).startsWith('https://'))
          .length,
      greaterThanOrEqualTo(5),
    );
    expect(
      peliculas
          .where((p) => !(p['imagen'] as String).startsWith('https://'))
          .length,
      greaterThanOrEqualTo(5),
    );
    for (final p in peliculas) {
      for (final campo in ['respaldo', 'banner', 'portada']) {
        final file = File(p[campo] as String);
        expect(file.existsSync(), isTrue, reason: file.path);
        final codec = await ui.instantiateImageCodec(
          file.readAsBytesSync(),
          targetWidth: 80,
        );
        final frame = await codec.getNextFrame();
        expect(frame.image.height, greaterThan(0));
        frame.image.dispose();
        codec.dispose();
      }
    }
  });

  testWidgets('Póster remoto con respaldo sin red', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: 120,
          height: 180,
          child: ImagenPelicula(pelicula: peliculas[10]),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.cloud_off), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });
}
