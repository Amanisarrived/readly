import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readly/View/auth/presentation/login_screen.dart';

class LoginText extends StatelessWidget {
  const LoginText({required this.text, required this.subText, super.key});

  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: subText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
          ),
        ],
      ),
    );
  }
}
