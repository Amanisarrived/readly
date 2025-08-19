import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readly/Model/book_card.dart';

class AllStateProvider extends ChangeNotifier {
  final List<Book> _likedBooks = [];
  final List<Book> _cartBooks = [];

  List<Book> get likedBooks => _likedBooks;
  List<Book> get cartBooks => _cartBooks;

  String get _userId => FirebaseAuth.instance.currentUser!.uid;
  final _firestore = FirebaseFirestore.instance;

  Future<void> _updateFirestore() async {
    await _firestore.collection('users').doc(_userId).set({
      'likedBooks': _likedBooks.map((b) => b.toMap()).toList(),
      'cartBooks': _cartBooks.map((b) => b.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  void addBook(Book book) {
    if (!_likedBooks.contains(book)) {
      _likedBooks.add(book);
      _updateFirestore();
      notifyListeners();
    }
  }

  void removeBook(Book book) {
    _likedBooks.remove(book);
    _updateFirestore();
    notifyListeners();
  }

  bool isBookLiked(Book book) {
    return _likedBooks.contains(book);
  }

  void addToCart(Book book) {
    if (!_cartBooks.contains(book)) {
      _cartBooks.add(book);
      _updateFirestore();
      notifyListeners();
    }
  }

  bool isBookInCart(Book book) {
    return _cartBooks.contains(book);
  }

  void removeFromCart(Book book) {
    _cartBooks.remove(book);
    _updateFirestore();
    notifyListeners();
  }

  Future<void> loadUserBooks() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return; // safeguard

    final doc = await _firestore.collection('users').doc(user.uid).get();

    if (doc.exists) {
      final data = doc.data()!;
      _likedBooks
        ..clear()
        ..addAll(
          (data['likedBooks'] as List<dynamic>? ?? []).map(
            (b) => Book.fromMap(b),
          ),
        );
      _cartBooks
        ..clear()
        ..addAll(
          (data['cartBooks'] as List<dynamic>? ?? []).map(
            (b) => Book.fromMap(b),
          ),
        );
      notifyListeners();
    }
  }
}
