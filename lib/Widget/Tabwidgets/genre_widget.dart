import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/BookFetching/trendingbook_preview.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Container(
              width: 400.w,
              height: 150.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(
                      92,
                      8,
                      21,
                      55,
                    ).withOpacity(0.2), // Shadow color
                    blurRadius: 12, // How soft the shadow is
                    spreadRadius: 2, // How much the shadow spreads
                    offset: Offset(0, 3), // Shadow in all directions (centered)
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/genre2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.w),
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
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: TrendingBookPreview(), // Later Add Fantasy Book data
            ),

            SizedBox(height: 10.h),

            // Spacing between sections
          ],
        ),
      ),
    );
  }
}
