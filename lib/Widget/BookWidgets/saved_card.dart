import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.catogery,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String rating;
  final String catogery;

  @override
  Widget build(BuildContext context) {
    final double parsedRating = double.tryParse(rating) ?? 0.0;
    final double progress = (parsedRating.clamp(0, 5)) / 5;

    //Color for inidcators
    Color getColor(double value) {
      if (value >= 4) return Theme.of(context).primaryColor;
      if (value >= 3) return Colors.green;
      return Colors.red;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey[100],
        ),

        height: 200.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10.r),
                child: Image.network(imageUrl, height: 150.h),
              ),
              SizedBox(width: 25.w),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 205.w,
                      child: Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      author,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(fontSize: 13.sp),
                    ),

                    SizedBox(height: 15.h),
                    Text("Catogery: $catogery"),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rating: ${parsedRating.toStringAsFixed(1)}/5",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(width: 5.w),
                        Icon(
                          Iconsax.star,
                          size: 13.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),

                    SizedBox(height: 5.h),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10.r),
                      child: Container(
                        width: 120.w,
                        height: 8.h,
                        child: LinearProgressIndicator(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
