import 'package:authentication_flutterfire/screens/home_screen.dart';
import 'package:authentication_flutterfire/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthController to = Get.find();
  Rxn<User> firebaseUser = Rxn<User>();
  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  handleAuthChanged(firebaseUser) async {
    if (firebaseUser == null) {
      Get.offAll(const LoginScreen());
    } else {
      Get.offAll(const HomeScreen());
    }
  }

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  // Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }
}
