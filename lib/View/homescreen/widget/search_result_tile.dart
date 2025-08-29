import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.rating,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final double parsedRating = double.tryParse(rating) ?? 0.0;
    final double progress = (parsedRating.clamp(0, 5)) / 5;

    //Color for inidcators
    Color getColor(double value) {
      if (value >= 4) return Colors.green;
      if (value >= 3) return Theme.of(context).primaryColor;
      return Colors.red;
    }

    return Container(
      height: 130.h,
      width: 200.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(76, 158, 158, 158),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8.r),
              child: Image.network(imageUrl, height: 110.h),
            ),
            Gap(15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                Gap(5.h),
                Text(
                  "Author : $author",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                  ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    Text("Rating $rating"),
                    Gap(5.w),
                    Icon(
                      Iconsax.star,
                      color: getColor(parsedRating),
                      size: 15.sp,
                    ),
                  ],
                ),
                Gap(5.h),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                  child: SizedBox(
                    width: 100.w,
                    height: 8.h,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10.r),
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        getColor(parsedRating),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
