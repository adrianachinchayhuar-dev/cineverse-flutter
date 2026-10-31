// Servidor estático de desarrollo: no forma parte de la aplicación ni almacena datos.
import 'dart:io';

Future<void> main() async {
  final raiz = Directory('build/web').absolute.path;
  final servidor = await HttpServer.bind(InternetAddress.loopbackIPv4, 7362);
  stdout.writeln('Vista previa: http://127.0.0.1:7362');
  await for (final solicitud in servidor) {
    final ruta = solicitud.uri.path == '/' ? '/index.html' : solicitud.uri.path;
    if (ruta.contains('..')) {
      solicitud.response.statusCode = HttpStatus.forbidden;
    } else {
      final archivo = File('$raiz$ruta');
      if (await archivo.exists()) {
        const tipos = {
          'html': 'text/html',
          'js': 'application/javascript',
          'json': 'application/json',
          'css': 'text/css',
          'wasm': 'application/wasm',
          'png': 'image/png',
          'jpg': 'image/jpeg',
          'webp': 'image/webp',
          'ttf': 'font/ttf',
        };
        final extension = ruta.split('.').last;
        solicitud.response.headers.set(
          'Content-Type',
          tipos[extension] ?? 'application/octet-stream',
        );
        solicitud.response.headers.set('Cache-Control', 'no-cache');
        await solicitud.response.addStream(archivo.openRead());
      } else {
        solicitud.response.statusCode = HttpStatus.notFound;
      }
    }
    await solicitud.response.close();
  }
}
