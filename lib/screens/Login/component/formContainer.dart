import 'package:flutter/material.dart';
import '../../Login/component/formField.dart';
import '../../Login/LoginScreen.dart';

class formContainer extends StatefulWidget {
  const formContainer({super.key});

  @override
  State<formContainer> createState() => _formContainerState();
}

class _formContainerState extends State<formContainer> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
        child: Column(
      children: [
        formField(
            controller: emailController,
            hint: "Email",
            icon: const Icon(Icons.person)),
        formField(
          controller: passController,
          hint: "Password",
          icon: const Icon(Icons.lock),
          isPass: true,
        ),
      ],
    ));
  }
}
