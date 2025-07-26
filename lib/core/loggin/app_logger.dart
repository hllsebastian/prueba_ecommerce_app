// lib/core/logger/app_logger.dart

import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // evita mostrar stack innecesario
      errorMethodCount: 5, // para errores, muestra más detalles
      colors: true,
      printEmojis: true,
    ),
  );

  static void info(String message) => _logger.i(message);

  static void warning(String message) => _logger.w(message);

  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  static void debug(String message) => _logger.d(message);
}
