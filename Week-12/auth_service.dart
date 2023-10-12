import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebase_auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebase_auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebase_auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    try {
      firebase_auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
