import 'package:encrypt/encrypt.dart';

class Encryption {
  Encryption(){
    print(encrypt('11111111'));
  }

  static const encryptionKey = "RaYnalDSAgeKRISnawan123210092RSK";
  static const encryptionIV = "RayNaldSag3Kr1sN";

  static encrypt(String plainText){
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromUtf8(encryptionIV);

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    if (key.bytes.length != 32) {
      throw ArgumentError('Encryption key must be 32 bytes long for AES-256.');
    }

    if (iv.bytes.length != 16) {
      throw ArgumentError('Initialization vector (IV) must be 16 bytes long.');
    }

    return encrypted.base64;
  }

  static decrypt(String cipherText){
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromUtf8(encryptionIV);

    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(cipherText), iv: iv);

    return decrypted;
  }
}