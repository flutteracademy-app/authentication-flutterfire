import 'dart:developer';

import 'package:athentication_flutterfire/components/apple_sign_in_button.dart';
import 'package:athentication_flutterfire/components/email_sign_in_button.dart';
import 'package:athentication_flutterfire/components/facebook_sign_in_button.dart';
import 'package:athentication_flutterfire/components/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("********* Build LoginScreen *********");
    bool darkMode = false;
    double buttonHeight = 40;
    double buttonWidth = 300;

    return Scaffold(
        body: Center(
      child: SizedBox(
        height: 550,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView(
            padding: const EdgeInsets.all(0),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/flutteracademy-logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    margin: const EdgeInsets.all(8),
                    child: GoogleSignInButton(
                      darkMode: darkMode,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    margin: const EdgeInsets.all(8),
                    child: AppleSignInButton(
                      darkMode: darkMode,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    margin: const EdgeInsets.all(8),
                    child: FacebookSignInButton(
                      darkMode: darkMode,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    margin: const EdgeInsets.all(8),
                    child: EmailSignInButton(
                      darkMode: darkMode,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
