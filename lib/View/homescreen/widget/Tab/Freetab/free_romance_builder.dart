import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Widget/ReusableWidget/card_widget.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_loading.dart';

class FreeRomacneBuilder extends StatelessWidget {
  const FreeRomacneBuilder({required this.freebooks, super.key});

  final List<Book> freebooks;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: freebooks.length,
        itemBuilder: (context, index) {
          if (freebooks.isEmpty) {
            return const ShimmerLoading();
          }
          final books = freebooks[index];
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
