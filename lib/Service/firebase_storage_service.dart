import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageUrl(String filename) async {
  try {
    final ref = FirebaseStorage.instance.ref().child("posters/$filename");
    return await ref.getDownloadURL();
  } catch (e) {
    throw Exception("Error getting image $filename : $e");
  }
}
