// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Widget/BookWidgets/book_details_tab.dart';
import 'package:readly/Widget/CustomWidget/custom_btn.dart';
import 'package:readly/Widget/CustomWidget/release_detal.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    required this.author,
    required this.imageUrl,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.description,
    super.key,
  });

  final String title;
  final String imageUrl;
  final String author;
  final String releaseDate;
  final String rating;
  final String description;

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_open, color: Theme.of(context).primaryColor),
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
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        imageUrl,
                        height: 250.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
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

          CustomBtn(),
        ],
      ),
    );
  }
}
