import 'package:flutter_secure_storage/flutter_secure_storage.dart';
final secureStorateShared = SecureStorage();
class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<dynamic> readSecureData(String key) async {
    return await storage.read(key: key) ?? '';
    // print('Data read from secure storage: $value');
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}
