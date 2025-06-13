import 'package:crypt/crypt.dart';
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

  Future<void> encryptAndStorePassword(String password) async {
    await storage.write(
      key: 'password',
      value: Crypt.sha256(password).toString(),
    );
  }

  Future<bool> decryptAndCheckPassword(String password) async {
    final hashedPassword = await storage.read(key: 'password');
    if (hashedPassword != null) {
      final h = Crypt(hashedPassword);
      return h.match(password) ? true : false;
    } else {
      return false;
    }
  }
}
