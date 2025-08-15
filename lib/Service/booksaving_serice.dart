import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:readly/Model/book_card.dart';

class BookUploadService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  /// Save liked or cart books
  Future<void> saveBookList({
    required String listName, // 'likedBooks' or 'cartBooks'
    required List<Book> books,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception("No user logged in");

    final booksMap = books.map((b) => b.toMap()).toList();

    await _firestore.collection('users').doc(user.uid).set({
      listName: booksMap,
    }, SetOptions(merge: true));
  }

  /// Fetch liked or cart books
  Future<List<Book>> fetchBookList(String listName) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception("No user logged in");

    final doc = await _firestore.collection('users').doc(user.uid).get();

    if (!doc.exists || doc.data()![listName] == null) return [];

    final List<dynamic> listData = doc.data()![listName];
    return listData.map((item) => Book.fromMap(item)).toList();
  }
}
