import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteLocalStorage {
  static final SqfliteLocalStorage _instance = SqfliteLocalStorage._internal();
  static Database? _database;

  factory SqfliteLocalStorage() => _instance;

  SqfliteLocalStorage._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'local_storage.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE storage (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            storage_key TEXT UNIQUE,
            storage_value TEXT
          )
        ''');
      },
    );
  }

  /// Save or update data
  Future<void> setData(String key, Map<String, dynamic> data) async {
    final db = await database;
    final jsonString = jsonEncode(data);
    await db.insert('storage', {
      'storage_key': key,
      'storage_value': jsonString,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Get data
  Future<Map<String, dynamic>?> getData(String key) async {
    final db = await database;
    final result = await db.query(
      'storage',
      where: 'storage_key = ?',
      whereArgs: [key],
    );

    if (result.isNotEmpty) {
      return jsonDecode(result.first['storage_value'] as String);
    }
    return null;
  }

  /// Delete specific data
  Future<void> deleteData(String key) async {
    final db = await database;
    await db.delete('storage', where: 'storage_key = ?', whereArgs: [key]);
  }

  /// Clear all local data
  Future<void> clearAll() async {
    final db = await database;
    await db.delete('storage');
  }
}
