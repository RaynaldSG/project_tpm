import 'package:flutter/material.dart';
import 'package:project_tpm/screens/Login/component/formContainer.dart';
import 'package:project_tpm/screens/Login/component/logoImage.dart';
import 'package:project_tpm/screens/Login/component/registerText.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/LoginController.dart';
import '../../controller/SharedPreferenceController.dart';
import 'component/loginButton.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
final loginFormKey = GlobalKey<FormState>();
final LoginController loginController = LoginController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences loginData;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();

    if (loginData.getBool('login') ?? false) {
      await SharedPreferenceController.init();
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPallete.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoImage(),
              formContainer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  loginButton(),
                ],
              ),
              registerText(),
            ],
          ),
        ),
      ),
    );
  }
}
