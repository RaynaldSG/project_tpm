import 'package:flutter/material.dart';

import '../../../controller/RegisterController.dart';
import '../../../utils/color/colorPalette.dart';
import '../RegisterScreen.dart';

class registerButton extends StatefulWidget {
  const registerButton({super.key});

  @override
  State<registerButton> createState() => _registerButtonState();
}

class _registerButtonState extends State<registerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.only(top: 30, right: 30),
      child: IconButton(
        onPressed: () => RegisterController.registerLogic(context, registerFormKey),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallete.primaryColor,
          foregroundColor: ColorPallete.thirdColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.chevron_right),
      ),
    );
  }
}
