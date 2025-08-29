import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/View/bookdetailsscreen/presentation/book_details.dart';
import 'package:readly/provider/state_provider.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    required this.book,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.releaseDate,
    required this.rating,
    super.key,
  });
  final String imageUrl;
  final String title;
  final String author;
  final Book book;
  final String releaseDate;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final double parsedRating = double.tryParse(rating) ?? 0.0;
    final double progress = (parsedRating.clamp(0, 5)) / 5;
    final stateProvider = Provider.of<AllStateProvider>(context, listen: true);
    final isLiked = stateProvider.isBookLiked(book);

    //Color for inidcators
    Color getColor(double value) {
      if (value >= 4) return Colors.green;
      if (value >= 3) return Theme.of(context).primaryColor;
      return Colors.red;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: SizedBox(
        height: 180.h,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetails(
                            author: author,
                            imageUrl: imageUrl,
                            title: title,
                            releaseDate: book.releaseDate,
                            rating: book.rating,
                            description: book.description,
                            book: book,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      height: 149.h,
                      width: 90.w,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10.r),
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(right: 30.w, left: 12.w),
                    child: SizedBox(
                      height: 170.h,
                      width: 187.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            title,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),
                          ),

                          Gap(10.h),

                          Text(
                            author,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                          ),

                          Gap(10.h),

                          Text(
                            releaseDate,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 10.sp),
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
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 300.w,
              top: 10.h,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 6,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: isLiked
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  child: IconButton(
                    onPressed: () {
                      if (isLiked) {
                        stateProvider.removeBook(book);
                      } else {
                        stateProvider.addBook(book);
                      }
                    },
                    icon: Icon(
                      size: isLiked ? 20.r : 18.r,
                      Iconsax.like_1,
                      color: isLiked
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
