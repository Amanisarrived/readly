// shimmer_image_loader.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerBannerLoader extends StatelessWidget {
  const ShimmerBannerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 390.w, // fixed width
        height: 150.h, // fixed height
        decoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
