import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/View/viewallpage/widgets/grid_card.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({required this.books, super.key});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      trackVisibility: true,
      thickness: 6, // Width of scrollbar
      radius: const Radius.circular(12), // Rounded corners
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      thumbColor: Theme.of(context).primaryColor.withAlpha(128),
      child: ListView.builder(
        itemCount: books.length,
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 30.h),

        itemBuilder: (context, index) {
          final book = books[index];
          return GridCard(
            imageUrl: book.imageUrl,
            title: book.title,
            book: book,
            author: book.author,
            releaseDate: book.releaseDate,
            rating: book.rating,
          );
        },
      ),
    );
  }
}
