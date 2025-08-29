import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readly/Model/book_card.dart'; // adjust path to your Book model

class SearchingService {
  Future<List<Book>> searchBooksAcrossCollection(String query) async {
    final collections = [
      'fantasy',
      'romance',
      'books',
      'trending',
      'drama',
      'selfhelp',
      'thriller',
      'colleenHover',
      'jkrowling',
    ];

    List<Book> result = [];

    for (var collection in collections) {
      final snapshot = await FirebaseFirestore.instance
          .collection(collection)
          .where("title", isGreaterThanOrEqualTo: query)
          .where("title", isLessThan: "$query\uf8ff")
          .limit(10)
          .get();

      result.addAll(
        snapshot.docs.map((doc) {
          final data = doc.data();
          // inject category manually since your model expects it
          data['catogery'] = collection;
          return Book.fromMap(data);
        }),
      );
    }

    return result;
  }
}
