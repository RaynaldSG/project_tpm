import 'package:flutter/material.dart';

import '../../../utils/color/colorPalette.dart';

class formField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hint;
  final Icon icon;

  const formField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      this.isPass = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: isPass,
        cursorColor: ColorPallete.primaryColor,
        decoration: InputDecoration(
          labelText: hint,
          hintText: hint,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: ColorPallete.thirdColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: ColorPallete.thirdColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: ColorPallete.primaryColor,
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Fill This Field";
          }
          if (!value.contains('@') && !isPass) {
            return "Please use correct email address using @";
          }
          if (value.length < 8 && isPass) {
            return 'Minimum Password Lenght is 8';
          }
          return null;
        },
      ),
    );
  }
}
