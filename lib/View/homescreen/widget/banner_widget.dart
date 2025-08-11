import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_banner_loading.dart';

class BannerWidget extends StatelessWidget {
  final String fileName;
  final String folderName; // e.g., "author.png" or "genre_banner.jpg"

  const BannerWidget({
    super.key,
    required this.fileName,
    required this.folderName,
  });

  Future<String> _getImageUrl() async {
    final ref = FirebaseStorage.instance.ref().child('$folderName/$fileName');
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getImageUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerBannerLoader();
        } else if (snapshot.hasError) {
          return const Center(child: Icon(Icons.error));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Image not found'));
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(snapshot.data!, fit: BoxFit.cover),
        );
      },
    );
  }
}
