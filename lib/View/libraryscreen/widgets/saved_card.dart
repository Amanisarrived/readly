import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/View/bookdetailsscreen/presentation/book_details.dart';
import 'package:readly/View/libraryscreen/widgets/library_btn.dart';

import 'package:readly/provider/state_provider.dart';

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
    final allprovider = Provider.of<AllStateProvider>(context);
    final allreadyInCart = allprovider.isBookInCart(book);

    final double parsedRating = double.tryParse(rating) ?? 0.0;
    // final double progress = (parsedRating.clamp(0, 5)) / 5;

    //Color for inidcators
    Color getColor(double value) {
      if (value >= 4) return Colors.green;
      if (value >= 3) return Theme.of(context).primaryColor;
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
                    width: 100.w,
                    height: 150.h,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 25.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
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

                        SizedBox(height: 10.h),
                        LibraryBtn(
                          onPressed: () {
                            if (allreadyInCart) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(
                                    0xFFFFE0E0,
                                  ), // light red background
                                  content: Text(
                                    '⚠️ Book is already in your cart!',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              allprovider.addToCart(book);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: const Color(
                                    0xFFE0FFE0,
                                  ), // light green background
                                  content: Text(
                                    '✔️ ${book.title} book added to cart!',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          },
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
