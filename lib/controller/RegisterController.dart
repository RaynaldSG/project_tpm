import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
import '../model/UserModel.dart';
import '../screens/Register/RegisterScreen.dart';

class RegisterController {
  static void registerLogic(BuildContext context, GlobalKey<FormState> registerFormState){
    List<String>? emailData = dataBox.get('email');

    if(registerFormState.currentState!.validate()){
      if(emailData == null){
        dataBox.put('email', [emailControllerR.text]);
        dataBox.put(emailControllerR.text, UserModel(fullName: fullNControllerR.text, email: emailControllerR.text, password: passControllerR.text));
        UserModel user = dataBox.get(emailControllerR.text);
        print(user.toString());
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
      else if(!emailData.contains(emailControllerR.text)){
        emailData.add(emailControllerR.text);
        dataBox.put('email', emailData);
        dataBox.put(emailControllerR.text, UserModel(fullName: fullNControllerR.text, email: emailControllerR.text, password: passControllerR.text));
        UserModel user = dataBox.get(emailControllerR.text);
        print(user.toString());
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      }
      else{
        SnackBar snackBar = const SnackBar(content: Text("Register Failed, Change Your Email"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    else{
      SnackBar snackBar = const SnackBar(content: Text("Register Failed"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // print("DEBUG: [REGISTER CONTROLLER (HIVE]: ${dataBox.get('email')}");
  }
}