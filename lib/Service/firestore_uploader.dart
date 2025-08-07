import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadSinlgeBook(List<Map<String, dynamic>> newArrivals) async {
  final collection = FirebaseFirestore.instance.collection("books");

  for (var newarrived in newArrivals) {
    await collection.add(newarrived);
  }
}
