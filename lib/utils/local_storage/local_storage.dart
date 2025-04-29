import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  // Secure storage instance
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<String?> readValue(String key) async {
    return await storage.read(key: key);
  }

  Future<bool> clearValue(String key) async {
    await storage.delete(key: key);
    return true;
  }

  Future<void> clearAll() async {
    await storage.deleteAll();
  }
}
