import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/BookFetching/fantacybook_preview.dart';
import 'package:readly/BookFetching/romancebook_preview.dart';
import 'package:readly/BookFetching/thrillerbook_preview.dart';
import 'package:readly/Widget/ReusableWidget/section_title.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({super.key});

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
                  "https://firebasestorage.googleapis.com/v0/b/shoppinglist-823a2.firebasestorage.app/o/posters%2Fgenre_banner.png?alt=media&token=47475698-aad9-4d21-a59e-81b91bb3cc41",
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // 🔤 Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Fantasy",
                actionText: "View All",
                collectionName: "fantasy",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const FantasyBookPreview(),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Romance",
                actionText: "View All",
                collectionName: "romance",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const RomanceBookPreview(),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Thriller/Fantacy",
                actionText: "View All",
                collectionName: "thriller",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: const ThrillerBookPreview(),
            ),
          ],
        ),
      ),
    );
  }
}
