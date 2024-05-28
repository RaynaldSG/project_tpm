import 'package:flutter/material.dart';

class logoImage extends StatelessWidget {
  const logoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
