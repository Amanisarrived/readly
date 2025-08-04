import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/BookFetching/books_preview.dart';
import 'package:readly/BookFetching/trendingbook_preview.dart';
import 'package:readly/Widget/ReusableWidget/section_title.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.w, right: 1.w),
              child: const SectionTitle(
                title: "New Arrivals",
                actionText: "ViewAll",
                collectionName: "books",
              ),
            ),
            const BooksPreview(),
            // Spacing between sections
            Padding(
              padding: EdgeInsets.only(left: 1.w, right: 1.w),
              child: const SectionTitle(
                title: "Trending",
                actionText: "ViewAll",
                collectionName: "trending",
              ),
            ),
            SizedBox(height: 5.h),

            const TrendingBookPreview(axis: Axis.horizontal),
          ],
        ),
      ),
    );
  }
}
