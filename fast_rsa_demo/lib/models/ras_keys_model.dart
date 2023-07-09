import 'package:fast_rsa/fast_rsa.dart';

class RSAKeys {
  late int _size;
  late String _publicKey;
  late String _privateKey;

  RSAKeys({required int size}) {
    _size = size;
  }

  Future generate() async {
    KeyPair result = await RSA.generate(_size);
    _publicKey = result.publicKey;
    _privateKey = result.privateKey;
  }

  Future<String> encryptString(String message) async {
    return RSA.encryptPKCS1v15(message, _publicKey);
  }

  Future<String> decryptString(String encryptedMessage) async {
    return RSA.decryptPKCS1v15(encryptedMessage, _privateKey);
  }

  get publicKey {
    return _publicKey;
  }

  get privateKey {
    return _privateKey;
  }

  @override
  String toString() {
    return 'RSAKeys(publicKey: $_publicKey, privateKey: $_privateKey)';
  }
}
