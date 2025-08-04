import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/libraryscreen/widgets/saved_card.dart';
import 'package:readly/provider/state_provider.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    final savedBookProvider = Provider.of<AllStateProvider>(context);
    final int savedBookscount = savedBookProvider.likedBooks.length;
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
                Row(
                  children: [
                    const Icon(Iconsax.book_saved),
                    SizedBox(width: 5.w),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 14.sp,
                      child: Text(
                        savedBookscount.toString(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          savedBookProvider.likedBooks.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(
                          "assets/images/empty_ghost.json",
                          width: 200.w,
                          height: 120.h,
                        ),
                      ),
                      Text(
                        "No Books Found!",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: SlidableAutoCloseBehavior(
                    child: RawScrollbar(
                      trackVisibility: true,
                      thickness: 6, // Width of scrollbar
                      radius: const Radius.circular(12), // Rounded corners
                      interactive: true,
                      scrollbarOrientation: ScrollbarOrientation.right,
                      thumbColor: Theme.of(context).primaryColor.withAlpha(128),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: savedBookProvider.likedBooks.length,
                        itemBuilder: (context, index) {
                          final book = savedBookProvider.likedBooks[index];
                          return SizedBox(
                            height: 200.h,
                            child: Slidable(
                              key: ValueKey(book.title),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.r),
                                      bottomLeft: Radius.circular(20.r),
                                    ),
                                    onPressed: (context) {
                                      savedBookProvider.removeBook(book);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '✔️ ${book.title} removed from library!',
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                          backgroundColor: const Color.fromARGB(
                                            169,
                                            60,
                                            244,
                                            54,
                                          ),
                                        ),
                                      );
                                    },

                                    backgroundColor: Colors.red,
                                    icon: Iconsax.trash,
                                    label: "Remove",
                                  ),
                                ],
                              ),
                              child: SavedCard(
                                imageUrl: book.imageUrl,
                                title: book.title,
                                author: book.author,
                                rating: book.rating,
                                catogery: book.catogery,
                                book: book,
                                description: book.description,
                                releaseDate: book.releaseDate,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
