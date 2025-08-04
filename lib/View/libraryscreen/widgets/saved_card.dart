import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/View/bookdetailsscreen/presentation/book_details.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    required this.author,
    required this.imageUrl,
    required this.title,
    required this.catogery,
    required this.description,
    required this.book,
    required this.releaseDate,

    required this.rating,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String catogery;
  final String description;
  final Book book;
  final String releaseDate;

  final String rating;

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

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BookDetails(
            author: author,
            imageUrl: imageUrl,
            title: title,
            releaseDate: releaseDate,
            rating: rating,
            description: description,
            book: book,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[100],
          ),

          height: 300.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width: 100.w, // Set your desired fixed width
                    height: 150.h, // Set your desired fixed height
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 25.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h), // reduce top padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 206.w,
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
                        SizedBox(height: 10.h),
                        Text("Category: $catogery"),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Text("Rating: $rating"),
                            SizedBox(width: 5.w),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: Icon(
                                Iconsax.star,
                                color: getColor(parsedRating),
                                size: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
