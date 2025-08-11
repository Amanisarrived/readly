// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Service/url_service.dart';
import 'package:readly/View/bookdetailsscreen/widgets/tabs/book_details_tab.dart';
import 'package:readly/Widget/ReusableWidget/custom_btn.dart';
import 'package:readly/View/bookdetailsscreen/widgets/release_detal.dart';
import 'package:readly/provider/state_provider.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    required this.author,
    required this.imageUrl,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.description,
    required this.book,
    super.key,
  });

  final String title;
  final String imageUrl;
  final String author;
  final String releaseDate;
  final String rating;
  final String description;
  final Book book;

  @override
  Widget build(BuildContext context) {
    final allprovider = Provider.of<AllStateProvider>(context);
    final cartItem = allprovider.cartBooks.length;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Row(
              children: [
                const Icon(Iconsax.shopping_cart),
                SizedBox(width: 5.w),
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 14.sp,
                  child: Text(
                    cartItem.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(
                            0,
                            5,
                          ), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        imageUrl,
                        height: 220.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(author),
                  SizedBox(height: 20.h),

                  ReleaseDetails(rating: rating, releaseDate: releaseDate),
                  SizedBox(height: 15.h),

                  Expanded(child: BookDetailsTab(description: description)),
                ],
              ),
            ),
          ),

          CustomBtn(
            onPressed: () {
              UrlService().launchBookLink(book.bookUrl);
            },
          ),
        ],
      ),
    );
  }
}
