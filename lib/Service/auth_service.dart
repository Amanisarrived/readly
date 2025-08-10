import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instanceFor(app: Firebase.app());
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
              "isFirstTime": true,
            });
      }

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw _handleError(e);
    }
  }

  //Login
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

  //Sign in with google

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: "Sign-In Aborted",
          message: "User Aborted the Google sign in flow",
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final userDoc = _firestore.collection("users").doc(user.uid);
        if (!(await userDoc.get()).exists) {
          await userDoc.set({
            "name": user.displayName ?? "",
            "email": user.email ?? "",
            "photoUrl": user.photoURL ?? "",
            "createAt": FieldValue.serverTimestamp(),
          });
        }
      }
      return userCredential;
    } catch (e) {
      throw Exception("Google Sign-In failed: $e");
    }
  }

  Future<bool> checkClearFirstTimeFlag(User user) async {
    final userdoc = _firestore
        .collection("users")
        .doc(user.uid); //getting user collections
    final snapshot = await userdoc.get(); //getting data

    if (snapshot.exists) {
      final data = snapshot.data()!;
      final isFirstTime = data["isFirstTime"] ?? false;

      if (isFirstTime) {
        //set flasg to false so wont ask notifiaction again
        await userdoc.update({"isFirstTime": false});
        return true;
      }
    }
    return false;
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
        return 'Error ${e.code}';
    }
  }
}
