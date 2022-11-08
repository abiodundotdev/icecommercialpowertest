import 'package:logger/logger.dart';

class AppLogger {
  AppLogger() : logger = Logger();
  final Logger logger;
  void error(dynamic message, [StackTrace? st]) {
    logger.e(message, st);
  }

  void info(dynamic message, [StackTrace? st]) {
    logger.i(message, st);
  }

  void debug(dynamic message, [StackTrace? st]) {
    logger.d(message, st);
  }

  void warning(dynamic message, [StackTrace? st]) {
    logger.w(message, st);
  }

  void verbose(dynamic message, [StackTrace? st]) {
    logger.v(message, st);
  }
}
