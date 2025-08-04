import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Widget/ReusableWidget/card_widget.dart';

class Fetching extends StatelessWidget {
  const Fetching({required this.booksToShow, super.key});
  final List<Book> booksToShow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: booksToShow.length,
        itemBuilder: (context, index) {
          final books = booksToShow[index];
          return CardWidget(
            book: books,
            author: books.author,
            imageurl: books.imageUrl,
            title: books.title,
            releaseDate: books.releaseDate,
            rating: books.rating,
            description: books.description,
          );
        },
      ),
    );
  }
}
