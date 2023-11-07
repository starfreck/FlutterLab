import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final secureStorage = _getSecureStorage();
  static final Storage _storage = Storage._internal();

  factory Storage() {
    return _storage;
  }

  Storage._internal();

  static FlutterSecureStorage _getSecureStorage() {
    // This will prevent errors due to mixed usage of encryptedSharedPreferences
    if (Platform.isAndroid) {
      return const FlutterSecureStorage(
          aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));
    }

    if (Platform.isIOS) {
      return const FlutterSecureStorage(
          iOptions:
              IOSOptions(accessibility: KeychainAccessibility.first_unlock));
    }

    return const FlutterSecureStorage();
  }

  Future<void> write({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await secureStorage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await secureStorage.delete(key: key);
  }

  Future<bool> containsKey({required String key}) async {
    return await secureStorage.containsKey(key: key);
  }

  // Note: This method is not supported on Windows so it is commented out.

  // Future<Map<String, String>> readAll() async {
  //   return await secureStorage.readAll();
  // }

  // Future<void> deleteAll() async {
  //   await secureStorage.deleteAll();
  // }
}
