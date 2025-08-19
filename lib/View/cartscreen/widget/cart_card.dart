import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Service/url_service.dart';
import 'package:readly/View/epubviewer/epubreader.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    required this.author,
    required this.imageUrl,
    required this.title,
    required this.catogery,
    required this.bookUrl,
    required this.book,

    super.key,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String catogery;
  final String bookUrl;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
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

                      ElevatedButton(
                        onPressed: () {
                          if (book.isFree) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SimpleEpubReader(
                                  epubUrl: book.bookUrl,
                                  title: title,
                                ),
                              ),
                            );
                          } else {
                            UrlService().launchBookLink(bookUrl);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          book.isFree ? "Download" : "Check Price",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
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
    );
  }
}
