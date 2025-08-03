import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/BookFetching/fantacybook_preview.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            // 🔥 Static Image from Firebase Storage
            Container(
              width: 400.w,
              height: 150.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(92, 8, 21, 55).withAlpha(51),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  // ✅ Your manually uploaded image URL
                  "https://firebasestorage.googleapis.com/v0/b/shoppinglist-823a2.firebasestorage.app/o/posters%2Fauthor.png?alt=media&token=ce8e8af5-056d-4a39-867a-a9e80b9d753c",
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // 🔤 Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fantasy", style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    "View All",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const FantasyBookPreview(),
            ),

            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
