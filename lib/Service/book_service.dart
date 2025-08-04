import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readly/Model/book_card.dart';

////// Hold File

class BookService {
  //Collections

  final CollectionReference booksCollection = FirebaseFirestore.instance
      .collection("books");

  final CollectionReference trendingBooksCollection = FirebaseFirestore.instance
      .collection("trending");

  final CollectionReference fantasyBooksCollection = FirebaseFirestore.instance
      .collection("fantasy");

  final CollectionReference romanceBooksCollection = FirebaseFirestore.instance
      .collection("romance");

  final CollectionReference thrillerBooksCollection = FirebaseFirestore.instance
      .collection("thriller");

  //Collections

  // Fetching methods

  Future<List<Book>> fetchNewArrivals() async {
    final snapshot = await booksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Book>> fetchTrendingBooks() async {
    final snapshot = await trendingBooksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Book>> fetchFantasyBooks() async {
    final snapshot = await fantasyBooksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Book>> fetchRomanceBooks() async {
    final snapshot = await romanceBooksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Book>> fetchThrillerBooks() async {
    final snapshot = await thrillerBooksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Fetching methods
}
