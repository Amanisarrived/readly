import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Image placeholder
            Container(
              height: 169.h,
              width: 117.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withAlpha(128), width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title placeholder
                Container(height: 14.h, width: 90.w, color: Colors.white),
                SizedBox(width: 5.w),
                // Circular Icon Button placeholder
                Container(
                  height: 32.w,
                  width: 32.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Author name or additional detail placeholder
            Container(height: 12.h, width: 60.w, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
