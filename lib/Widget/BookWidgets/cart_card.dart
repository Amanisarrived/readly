import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    required this.author,
    required this.imageUrl,
    required this.title,
    required this.catogery,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String catogery;

  @override
  Widget build(BuildContext context) {
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
