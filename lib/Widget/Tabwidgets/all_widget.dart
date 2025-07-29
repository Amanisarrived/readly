import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/BookFetching/books_preview.dart';
import 'package:readly/BookFetching/trendingbook_preview.dart';

class AllWidget extends StatelessWidget {
  const AllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              Text(
                "View All",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          BooksPreview(),
          SizedBox(height: 15.h), // Spacing between sections
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending Books",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              Text(
                "View All",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),

          TrendingBookPreview(),

          // Spacing between sections
        ],
      ),
    );
  }
}
