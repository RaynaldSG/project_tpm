import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class registerText extends StatelessWidget {
  const registerText({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 16);
    TextStyle linkStyle = TextStyle(color: Colors.blue[300]);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RichText(
          text: TextSpan(style: defaultStyle, children: <TextSpan>[
        const TextSpan(text: "cannot login? "),
        TextSpan(
            text: "sign up",
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.pushReplacementNamed(context, '/register');
            })
      ])),
    );
  }
}
