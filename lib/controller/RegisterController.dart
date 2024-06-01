import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_tpm/controller/UserController.dart';
import 'package:project_tpm/utils/notification/NotificationService.dart';
import 'package:project_tpm/utils/security/Encryption.dart';

import '../main.dart';
import '../model/UserModel.dart';
import '../screens/Register/RegisterScreen.dart';

class RegisterController {
  UserController userController = UserController();

  static void registerLogic(
      BuildContext context, GlobalKey<FormState> registerFormState) {
    List<String>? emailData = dataBox.get('email');

    if (registerFormState.currentState!.validate()) {
      if (emailData == null) {
        dataBox.put('email', [emailControllerR.text]);
        String password = Encryption.encrypt(passControllerR.text);
        dataBox.put(
            emailControllerR.text,
            UserModel(
                fullName: fullNControllerR.text,
                email: emailControllerR.text,
                password: password,
                imageLocation: ''));
        NotificationService().showNotification(title: 'Registration Success', body: 'Hi, ${fullNControllerR.text} welcome to ROOMR app');
        Timer(const Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      } else if (!emailData.contains(emailControllerR.text)) {
        emailData.add(emailControllerR.text);
        dataBox.put('email', emailData);
        String password = Encryption.encrypt(passControllerR.text);
        dataBox.put(
            emailControllerR.text,
            UserModel(
                fullName: fullNControllerR.text,
                email: emailControllerR.text,
                password: password,
                imageLocation: ''));
        print(
            'Encrypted Password: ${Encryption.encrypt(passControllerR.text)}');
        print('tes');
        NotificationService().showNotification(title: 'Registration Success', body: 'Hi, ${fullNControllerR.text} welcome to ROOMR app');
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        SnackBar snackBar =
        const SnackBar(content: Text("Register Failed, Change Your Email"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      SnackBar snackBar = const SnackBar(content: Text("Register Failed"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // print("DEBUG: [REGISTER CONTROLLER (HIVE]: ${dataBox.get('email')}");
  }
}
