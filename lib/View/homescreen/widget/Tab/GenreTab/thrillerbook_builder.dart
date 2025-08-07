import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Widget/ReusableWidget/card_widget.dart';

class ThrillerbookBuilder extends StatelessWidget {
  const ThrillerbookBuilder({required this.thrillerBooks, super.key});

  final List<Book> thrillerBooks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: thrillerBooks.length,
        itemBuilder: (context, index) {
          final books = thrillerBooks[index];
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
