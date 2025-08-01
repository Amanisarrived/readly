import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Widget/BookWidgets/saved_card.dart';
import 'package:readly/provider/state_provider.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    final List<Book> books = Provider.of<AllStateProvider>(context).likedBooks;
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Books",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.notification, size: 25.sp),
                ),
              ],
            ),
          ),

          books.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(
                          "assets/images/empty_ghost.json",
                          width: 200.w,
                          height: 200.h,
                        ),
                      ),
                      Text(
                        "No Books Found!",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return SavedCard(
                        imageUrl: book.imageUrl,
                        title: book.title,
                        author: book.author,
                        rating: book.rating,
                        catogery: book.catogery,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
