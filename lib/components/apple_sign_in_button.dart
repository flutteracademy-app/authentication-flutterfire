import 'package:authentication_flutterfire/components/sign_in_button.dart';
import 'package:flutter/material.dart';

class AppleSignInButton extends StatelessWidget {
  final bool darkMode;
  final VoidCallback onPressed;
  final bool centered;

  const AppleSignInButton(
      {required this.onPressed,
      this.darkMode = false,
      this.centered = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = darkMode ? Colors.black : Colors.white;
    Widget leading = Image.asset(
      darkMode
          ? "assets/images/auth_apple_logo_white.png"
          : "assets/images/auth_apple_logo_black.png",
    );

    return SignInButton(
      text: 'Iniciar sesión con' ' Apple',
      useAppleFont: true,
      buttonColor: buttonColor,
      textColor: darkMode ? Colors.white : Colors.black,
      leading: leading,
      onPressed: onPressed,
      centered: centered,
      leadingBackground: Colors.white,
    );
  }
}
