import 'package:authentication_flutterfire/controllers/auth_controller.dart';
import 'package:authentication_flutterfire/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    AuthController.to.firebaseUser.value!.photoURL!)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(AuthController.to.firebaseUser.value!.displayName!),
          const SizedBox(
            height: 20,
          ),
          Text(AuthController.to.firebaseUser.value!.email!),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                Get.to(const WebViewFlutteracademy());
              },
              child: const Text("Ir a mi web"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                AuthController.to.signOut();
              },
              child: const Text("Cerrar sesión"),
            ),
          ),
        ],
      ),
    );
  }
}
