import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadSinlgeBook(List<Map<String, dynamic>> thrillerBook) async {
  final collection = FirebaseFirestore.instance.collection("thriller");

  for (var thrillbook in thrillerBook) {
    await collection.add(thrillbook);
  }
}
