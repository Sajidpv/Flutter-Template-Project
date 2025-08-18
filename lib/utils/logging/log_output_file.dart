import 'dart:async';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class FileLogOutput extends LogOutput {
  IOSink? _sink;
  late File file;
  late String _currentDate;
  int _partIndex = 1;

  static const int maxFileSize = 5 * 1024 * 1024; // 5MB
  static const int keepDays = 7;

  // Simple mutex using a future chain
  Future<void> _op = Future.value();

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final logDir = Directory('${dir.path}/logs');
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }

    _currentDate = _today();
    file = await _createLogFile(logDir);
    await _cleanupOldLogs(logDir);

    _sink = file.openWrite(mode: FileMode.append);
  }

  @override
  void output(OutputEvent event) {
    // Queue work to guarantee serialization
    _op = _op
        .then((_) async {
          // Rotate before writing if needed
          await _rotateIfNeeded();

          final sink = _sink;
          if (sink == null) return;

          // Write lines
          for (final line in event.lines) {
            sink.writeln(line);
          }

          // Consider throttled flushing instead of per-call
          // await sink.flush();
        })
        .catchError((_) {
          // swallow logging errors to avoid cascading failures
        });
  }

  Future<void> _rotateIfNeeded() async {
    final logDir = file.parent;

    // Date-based rotation
    if (_currentDate != _today()) {
      _currentDate = _today();
      _partIndex = 1;
      await _switchToNewFile(logDir);
      return;
    }

    // Size-based rotation
    final length = await file.length();
    if (length > maxFileSize) {
      _partIndex++;
      await _switchToNewFile(logDir);
    }
  }

  Future<void> _switchToNewFile(Directory logDir) async {
    final sink = _sink;
    _sink = null; // prevent writes against a closing sink

    if (sink != null) {
      try {
        await sink.flush();
      } catch (_) {}
      try {
        await sink.close();
      } catch (_) {}
    }

    file = await _createLogFile(logDir);
    _sink = file.openWrite(mode: FileMode.append);

    await _cleanupOldLogs(logDir);
  }

  Future<File> _createLogFile(Directory logDir) async {
    final filename = 'app_${_currentDate}_part$_partIndex.log';
    return File('${logDir.path}/$filename');
  }

  Future<void> _cleanupOldLogs(Directory logDir) async {
    final files = logDir.listSync().whereType<File>().toList();
    final cutoff = DateTime.now().subtract(const Duration(days: keepDays));

    // Optional cap by count
    if (files.length > 50) {
      files.sort(
        (a, b) => a.statSync().modified.compareTo(b.statSync().modified),
      );
      try {
        await files.first.delete();
      } catch (_) {}
    }

    for (final f in files) {
      try {
        final stat = await f.stat();
        if (stat.modified.isBefore(cutoff)) {
          await f.delete();
        }
      } catch (_) {}
    }
  }

  String _today() => DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Future<void> destroy() async {
    // Drain queued writes first
    try {
      await _op;
    } catch (_) {}

    final sink = _sink;
    _sink = null;
    if (sink != null) {
      try {
        await sink.flush();
      } catch (_) {}
      try {
        await sink.close();
      } catch (_) {}
    }
  }
}
