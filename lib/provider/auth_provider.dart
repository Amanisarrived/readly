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

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isgoogleloginLoading => _isgoogleloginLoading;
  String? get userName => _userName;
  bool get isFirstTimeUser => _isFirstTimeUser;

  AuthProvider() {
    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      _user = user;

      if (_user != null) {
        _isFirstTimeUser = await _authService.checkClearFirstTimeFlag(_user!);
        await loadUserName(); // Load user name automatically on auth change
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

  Future<void> signOut() async {
    _setLoading(true);
    await _authService.signOut();
    _user = null;
    _errorMessage = null;
    _setLoading(false);
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

  Future<void> signInWithGoogle() async {
    _isgoogleloginLoading = true;
    notifyListeners();

    try {
      await _authService.signInWithGoogle();
    } catch (e) {
      debugPrint("Sign in failed : $e");
    }
    _isgoogleloginLoading = false;
    notifyListeners();
  }

  bool isuserLoggedIn() {
    return _authService.isUserLoggedIn();
  }
}
