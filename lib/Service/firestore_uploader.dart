import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadSinlgeBook(List<Map<String, dynamic>> bookdata) async {
  final collection = FirebaseFirestore.instance.collection("drama");

  for (var bookData in bookdata) {
    await collection.add(bookData);
  }
}
