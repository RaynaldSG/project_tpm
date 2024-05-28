import 'package:flutter/material.dart';
import '../../../controller/LoginController.dart';
import '../../../utils/color/colorPalette.dart';
import '../LoginScreen.dart';

class loginButton extends StatefulWidget {
  const loginButton({super.key});

  @override
  State<loginButton> createState() => _loginButtonState();
}

class _loginButtonState extends State<loginButton> {
  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.only(top: 30, right: 30),
      child: IconButton(
        onPressed: () => loginController.loginLogic(context, loginFormKey),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallete.primaryColor,
          foregroundColor: ColorPallete.fourthColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.chevron_right),
      ),
    );
  }
}
