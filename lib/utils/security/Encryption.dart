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