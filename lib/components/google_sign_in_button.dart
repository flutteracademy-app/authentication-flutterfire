import 'package:authentication_flutterfire/components/sign_in_button.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final bool darkMode;
  final VoidCallback onPressed;
  final bool centered;

  GoogleSignInButton(
      {required this.onPressed,
      this.darkMode = false,
      this.centered = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = darkMode ? Color(0xFF4285F4) : Colors.white;
    Widget leading = Image.asset("assets/images/auth_google_logo.png");

    return SignInButton(
      text: 'Iniciar sesión con' ' Google',
      buttonColor: buttonColor,
      textColor: darkMode ? Colors.white : Colors.black,
      leading: leading,
      leadingBackground: darkMode ? Colors.white : Colors.white,
      onPressed: onPressed,
      centered: centered,
    );
  }
}
