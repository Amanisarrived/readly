import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readly/Model/book_card.dart';

class BookService {
  final CollectionReference booksCollection = FirebaseFirestore.instance
      .collection("books");

  Future<List<Book>> fetchNewArrivals() async {
    final snapshot = await booksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
