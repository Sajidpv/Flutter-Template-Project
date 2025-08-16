import 'dart:io';

import '../../cors/configs/app_configs.dart';
import '../../utils/logging/log_output_file.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LoggerHelper {
  static FileLogOutput? _fileOutput;

  static File? get logFile => _fileOutput?.file;
  static bool get isFileLoggingEnabled => _fileOutput != null;

  static final bool _isProd = AppConfig.isProduction;

  static Future<void> initFileLogger({Level? level}) async {
    final fileOutput = FileLogOutput();
    await fileOutput.init();
    _fileOutput = fileOutput;

    // Console output (default)
    final consoleOutput = ConsoleOutput();

    // Combine file + console outputs
    final multiOutput = MultiOutput([consoleOutput, fileOutput]);

    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 8,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
      level: level ?? (_isProd ? Level.warning : Level.debug),
      output: multiOutput,
    );
  }

  static Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
    level: _isProd ? Level.warning : Level.debug,
  );

  static void debug(String message) => _logger.d(message);
  static void info(String message) => _logger.i(message);
  static void warning(String message) => _logger.w(message);
  static void error(String message, [dynamic error, StackTrace? stack]) =>
      _logger.e(message, error: error, stackTrace: stack ?? StackTrace.current);

  /// Returns all available log files (sorted by date desc)
  static Future<List<File>> getAllLogFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final logDir = Directory('${dir.path}/logs');

    if (!await logDir.exists()) {
      return [];
    }

    final files =
        logDir
            .listSync()
            .whereType<File>()
            .where((f) => f.path.endsWith(".log"))
            .toList();

    // Sort: newest first
    files.sort(
      (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
    );

    return files;
  }

  /// Clear ALL logs
  static Future<void> clearAllLogs() async {
    final files = await getAllLogFiles();
    for (final file in files) {
      await file.delete();
    }
    debug("All logs cleared");
  }
}
