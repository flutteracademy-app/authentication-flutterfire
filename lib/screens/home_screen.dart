import 'package:authentication_flutterfire/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
