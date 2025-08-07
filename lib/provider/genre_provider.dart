import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:readly/Model/book_card.dart';

class GenreProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Map<String, List<Book>> _genreBooks = {};

  List<Book> getBooksByGenre(String genre) => _genreBooks[genre] ?? [];

  Future<void> fetchBooksByGenre(String genre) async {
    try {
      final snapshot = await _firestore
          .collection(genre)
          .get(const GetOptions(source: Source.server));

      final books = snapshot.docs
          // ignore: unnecessary_cast
          .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      _genreBooks[genre] = books;
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching books for $genre: $e');
    }
  }

  Future<void> fetchAllGenres(List<String> genres) async {
    for (final genre in genres) {
      await fetchBooksByGenre(genre);
    }
  }
}
