import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instanceFor(app: Firebase.app());

  //Sign-Up
  Future<User?> signin(String email, String pass, String name) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // Store name and other data in Firestore
      if (result.user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set({
              'name': name,
              'email': email,
              'createdAt': FieldValue.serverTimestamp(),
            });
      }

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw _handleError(e);
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  // Error Handler
  String _handleError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email address.';
      case 'user-not-found':
        return 'User not found.';
      case 'wrong-password':
        return 'Wrong password.';
      case 'email-already-in-use':
        return 'Email already in use.';
      case 'weak-password':
        return 'Password should be at least 6 characters.';
      default:
        return 'Something went wrong. [${e.code}]';
    }
  }
}
