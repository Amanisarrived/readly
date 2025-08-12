import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:readly/Service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  User? _user;
  bool _isLoading = false;
  String? _errorMessage;
  String? _userName;
  bool _isgoogleloginLoading = false;
  bool _isFirstTimeUser = false;
  String? _emailOrName;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isgoogleloginLoading => _isgoogleloginLoading;
  String? get userName => _userName;
  bool get isFirstTimeUser => _isFirstTimeUser;
  String? get emailOrName => _emailOrName;

  AuthProvider() {
    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      _user = user;

      if (_user != null) {
        _isFirstTimeUser = await _authService.checkClearFirstTimeFlag(_user!);
        await loadUserName();
      } else {
        _userName = null;
        _isFirstTimeUser = false;
      }
      notifyListeners();
    });
  }
  Future<void> signIn(String email, String password, String name) async {
    _setLoading(true);
    try {
      _user = await _authService.signin(email, password, name);
      if (_user != null) {
        _isFirstTimeUser = await _authService.checkClearFirstTimeFlag(_user!);
        notifyListeners();
      }
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoading(false);
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      _user = await _authService.login(email, password);
      if (_user != null) {
        _isFirstTimeUser = await _authService.checkClearFirstTimeFlag(_user!);
        notifyListeners();
      }
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoading(false);
  }

  Future<bool> signOut() async {
    _setLoading(true);
    try {
      await _authService.signOut();
      _user = null;
      _errorMessage = null;
      return true; // ✅ success
    } catch (e) {
      _errorMessage = e.toString();
      return false; // ❌ failed
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loadUserName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    _userName = doc.data()?['name'];
    notifyListeners();
  }

  Future<bool> signInWithGoogle() async {
    _isgoogleloginLoading = true;
    notifyListeners();

    try {
      await _authService.signInWithGoogle();
      _isgoogleloginLoading = false;
      notifyListeners();
      return true; // login success
    } catch (e) {
      debugPrint("Sign in failed : $e");
      _isgoogleloginLoading = false;
      notifyListeners();
      return false; // login failed
    }
  }

  Future<void> loadEmail() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    _userName = doc.data()?['email'];
    notifyListeners();
  }

  Future<void> loadEmailOrName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      if (doc.exists) {
        final data = doc.data()!;
        _emailOrName =
            (data['email'] != null && data['email'].toString().isNotEmpty)
            ? data['email']
            : (data['username'] != null &&
                  data['username'].toString().isNotEmpty)
            ? data['username']
            : "No info available";
      } else {
        _emailOrName = "No info available";
      }
    } catch (e) {
      debugPrint("Error loading email or name: $e");
      _emailOrName = "No info available";
    }

    notifyListeners();
  }

  bool isuserLoggedIn() {
    return _authService.isUserLoggedIn();
  }
}
