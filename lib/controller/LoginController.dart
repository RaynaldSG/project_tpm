import 'package:flutter/material.dart';
import 'package:project_tpm/utils/notification/NotificationService.dart';
import 'package:project_tpm/utils/security/Encryption.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../model/UserModel.dart';
import '../screens/Login/LoginScreen.dart';
import 'SharedPreferenceController.dart';

class LoginController {
  late SharedPreferences loginData;

  LoginController() {
    getSharedPreferences();
  }

  void getSharedPreferences() async {
    loginData = await SharedPreferences.getInstance();
  }

  void loginLogic(BuildContext context, GlobalKey<FormState> loginFormState) {
    if (loginFormState.currentState!.validate() && dataBox.get('email') != null) {
      if (dataBox.get('email').contains(emailController.text)) {
        UserModel userData = dataBox.get(emailController.text);
        print(Encryption.decrypt(userData.password));
        if (Encryption.decrypt(userData.password) == passController.text) {
          loginData.setBool('login', true);
          loginData.setString('fullName', userData.fullName);
          loginData.setString('email', emailController.text);
          setSharedPreference();
          Navigator.pushReplacementNamed(context, '/home');
          return;
        }
      }
    }
    SnackBar snackBar = const SnackBar(content: Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void setSharedPreference() async{
    await SharedPreferenceController.init();
  }
}
