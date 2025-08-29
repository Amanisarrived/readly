import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(0),
            ),
            child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            height: 180,
            alignment: Alignment.center,
            child: const Text("Image not found 😔"),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(12.r)),
            child: Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const ShimmerBannerLoader();
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  height: 180,
                  child: const Icon(
                    Icons.broken_image,
                    size: 40,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
