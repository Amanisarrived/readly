import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Widget/ReusableWidget/card_widget.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_loading.dart';

class Jkrowlingbookbuilder extends StatelessWidget {
  const Jkrowlingbookbuilder({required this.jkrowling, super.key});

  final List<Book> jkrowling;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (jkrowling.isEmpty) {
            return const ShimmerLoading();
          }
          final books = jkrowling[index];
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
