import 'package:authentication_flutterfire/components/sign_in_button.dart';
import 'package:flutter/material.dart';

class FacebookSignInButton extends StatelessWidget {
  final String text;
  final bool darkMode;
  final VoidCallback onPressed;
  final bool centered;

  const FacebookSignInButton(
      {required this.onPressed,
      this.text = 'Iniciar sesión con Facebook',
      this.darkMode = false,
      this.centered = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Color(0xFF1877F2);
    Widget leading = Image.asset("assets/images/auth_facebook_logo.png");

    return SignInButton(
      text: text,
      buttonColor: buttonColor,
      textColor: Colors.white,
      leading: leading,
      onPressed: onPressed,
      centered: centered,
      leadingBackground: Color(0xFF1877F2),
    );
  }
}
