import 'package:flutter/material.dart';
import 'screens/principal.dart';
import 'screens/bienvenida.dart';

void main() => runApp(const CineVerseApp());

class CineVerseApp extends StatelessWidget {
  const CineVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50928),
          secondary: Color(0xFFE50928),
          onSecondary: Colors.white,
          surface: Color(0xFF17191F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000),
          scrolledUnderElevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Roboto', height: 1.6),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      // La bienvenida se reemplaza por el catálogo; los detalles usan push/pop.
      initialRoute: '/',
      // Al recargar una URL web, iniciamos una sola bienvenida en el historial.
      onGenerateInitialRoutes: (_) => [
        MaterialPageRoute<void>(
          settings: const RouteSettings(name: '/'),
          builder: (context) => const Bienvenida(),
        ),
      ],
      routes: {
        '/': (context) => const Bienvenida(),
        '/catalogo': (context) => const PantallaPrincipal(),
      },
      builder: (context, child) => ColoredBox(
        color: const Color(0xFF030407),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: child!,
          ),
        ),
      ),
    );
  }
}
