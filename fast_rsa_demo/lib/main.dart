import 'package:flutter/material.dart';
import 'package:fast_rsa_demo/app/app.dart';
import 'package:fast_rsa_demo/models/ras_keys_model.dart';

void main() async {
  RSAKeys rsaKeys = RSAKeys(size: 4096);

  await rsaKeys.generate();

  // ignore: avoid_print
  print("Public key: ${rsaKeys.publicKey}");
  // ignore: avoid_print, unnecessary_brace_in_string_interps
  print("Private key: ${rsaKeys.privateKey}");

  String msg = "Hello World!!";

  String encryptedMsg = await rsaKeys.encryptString(msg);
  // ignore: avoid_print
  print("\nEncrypted message: $encryptedMsg \n");

  String decryptedMsg = await rsaKeys.decryptString(encryptedMsg);

  // ignore: avoid_print
  print("\nDecrypted message: $decryptedMsg\n");

  runApp(const App());
}
