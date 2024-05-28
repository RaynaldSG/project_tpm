import 'package:flutter/material.dart';
import '../../Register//component/formField.dart';
import '../../Register/RegisterScreen.dart';

class formContainer extends StatefulWidget {
  const formContainer({super.key});

  @override
  State<formContainer> createState() => _formContainerState();
}

class _formContainerState extends State<formContainer> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: [
            formField(
                controller: fullNControllerR,
                hint: 'Full Name',
                icon: const Icon(Icons.person)),
            formField(
              controller: emailControllerR,
              hint: "Email",
              icon: const Icon(Icons.mail),
              isEmail: true,
            ),
            formField(
              controller: passControllerR,
              hint: "Password",
              icon: const Icon(Icons.lock),
              isPass: true,
            ),
          ],
        ));
  }
}
