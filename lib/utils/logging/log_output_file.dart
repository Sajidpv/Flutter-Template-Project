import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class FileLogOutput extends LogOutput {
  IOSink? _sink;
  late final File file;
  late String _currentDate;
  int _partIndex = 1;

  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const int keepDays = 7; // retain logs for 7 days

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final logDir = Directory('${dir.path}/logs');

    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }

    _currentDate = _today();
    file = await _createLogFile(logDir);

    // cleanup old logs
    await _cleanupOldLogs(logDir);

    _sink = file.openWrite(mode: FileMode.append);
  }

  @override
  void output(OutputEvent event) {
    final sink = _sink;
    if (sink == null) return;

    for (final line in event.lines) {
      sink.writeln(line);
    }
    sink.flush();

    _rotateIfNeeded();
  }

  Future<void> _rotateIfNeeded() async {
    final logDir = file.parent;

    // New day? -> new file
    if (_currentDate != _today()) {
      _currentDate = _today();
      _partIndex = 1;
      await _switchToNewFile(logDir);
      return;
    }

    // Size exceeded? -> new part file
    final length = await file.length();
    if (length > maxFileSize) {
      _partIndex++;
      await _switchToNewFile(logDir);
    }
  }

  Future<void> _switchToNewFile(Directory logDir) async {
    await _sink?.flush();
    await _sink?.close();

    file = await _createLogFile(logDir);
    _sink = file.openWrite(mode: FileMode.append);

    // cleanup
    await _cleanupOldLogs(logDir);
  }

  Future<File> _createLogFile(Directory logDir) async {
    final filename = "app_${_currentDate}_part$_partIndex.log";
    return File('${logDir.path}/$filename');
  }

  Future<void> _cleanupOldLogs(Directory logDir) async {
    final files = logDir.listSync().whereType<File>().toList();
    final cutoff = DateTime.now().subtract(Duration(days: keepDays));

    if (files.length > 50) {
      files.sort(
        (a, b) => a.statSync().modified.compareTo(b.statSync().modified),
      );
      await files.first.delete(); // delete oldest
    }

    for (final file in files) {
      final stat = await file.stat();
      if (stat.modified.isBefore(cutoff)) {
        await file.delete();
      }
    }
  }

  String _today() => DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
    _sink = null;
  }
}
