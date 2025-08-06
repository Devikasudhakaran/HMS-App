import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> writeToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
  }

  static Future<String?> readToken() async {
    return await _storage.read(key: 'accessToken');
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: 'accessToken');
  }
}