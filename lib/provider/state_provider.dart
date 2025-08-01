import 'package:flutter/material.dart';
import 'package:readly/Model/book_card.dart';

class AllStateProvider extends ChangeNotifier {
  final List<Book> _likedBooks = [];
  final List<Book> _cartBooks = [];

  List<Book> get likedBooks => _likedBooks;
  List<Book> get cartBooks => _cartBooks;

  void addBook(Book book) {
    if (!_likedBooks.contains(book)) {
      _likedBooks.add(book);
      notifyListeners();
    }
  }

  void removeBook(Book book) {
    _likedBooks.remove(book);
    notifyListeners();
  }

  bool isBookLiked(Book book) {
    return _likedBooks.contains(book);
  }

  void addToCart(Book book) {
    if (!_cartBooks.contains(book)) {
      _cartBooks.add(book);
      notifyListeners();
    }
  }

  void removeFromCart(Book book) {
    _cartBooks.remove(book);
    notifyListeners();
  }
}
