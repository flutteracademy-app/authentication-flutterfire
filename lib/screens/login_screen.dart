import 'dart:developer';

import 'package:authentication_flutterfire/components/apple_sign_in_button.dart';
import 'package:authentication_flutterfire/components/email_sign_in_button.dart';
import 'package:authentication_flutterfire/components/facebook_sign_in_button.dart';
import 'package:authentication_flutterfire/components/google_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
                      onPressed: () {
                        Future<UserCredential> signInWithGoogle() async {
                          // Trigger the authentication flow
                          final GoogleSignInAccount? googleUser =
                              await GoogleSignIn().signIn();

                          // Obtain the auth details from the request
                          final GoogleSignInAuthentication? googleAuth =
                              await googleUser?.authentication;

                          // Create a new credential
                          final credential = GoogleAuthProvider.credential(
                            accessToken: googleAuth?.accessToken,
                            idToken: googleAuth?.idToken,
                          );

                          // Once signed in, return the UserCredential
                          return await FirebaseAuth.instance
                              .signInWithCredential(credential);
                        }

                        signInWithGoogle();
                      },
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
                      onPressed: () async {
                        Future<UserCredential> signInWithFacebook() async {
                          // Trigger the sign-in flow
                          final LoginResult loginResult =
                              await FacebookAuth.instance.login();

                          // Create a credential from the access token
                          final OAuthCredential facebookAuthCredential =
                              FacebookAuthProvider.credential(
                                  loginResult.accessToken!.token);

                          // Once signed in, return the UserCredential
                          return FirebaseAuth.instance
                              .signInWithCredential(facebookAuthCredential);
                        }

                        try {
                          await signInWithFacebook();
                        } on FirebaseAuthException catch (e) {
                          log(e.code);
                          if (e.code ==
                              'account-exists-with-different-credential') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "La cuenta ya existe con otro m??todo de inicio de sesi??n")),
                            );
                          }
                        } catch (e) {
                          log('$e');
                        }
                      },
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
