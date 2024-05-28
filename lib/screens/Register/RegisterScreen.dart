import 'package:flutter/material.dart';
import 'package:project_tpm/utils/color/colorPalette.dart';
import '../Register/component/formContainer.dart';
import '../Register/component/logoImage.dart';
import 'component/loginText.dart';
import 'component/registerButton.dart';

TextEditingController fullNControllerR = TextEditingController();
TextEditingController emailControllerR = TextEditingController();
TextEditingController passControllerR = TextEditingController();
final registerFormKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const logoImage(),
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              const formContainer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 30), // Align button properly
                    child: registerButton(),
                  ),
                ],
              ),
              const loginText(),
            ],
          ),
        ),
      ),
    );
  }
}
