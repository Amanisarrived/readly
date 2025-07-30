import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Service/book_service.dart';
import 'package:readly/Widget/allwidget/card_widget.dart';
import 'package:readly/Widget/allwidget/shimmer_loading.dart';

class BooksPreview extends StatefulWidget {
  const BooksPreview({super.key});

  @override
  State<BooksPreview> createState() => _BooksPreviewState();
}

class _BooksPreviewState extends State<BooksPreview> {
  late Future<List<Book>> booksFuture;

  @override
  void initState() {
    super.initState();
    booksFuture = BookService().fetchNewArrivals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 250.h, // adjust based on your card height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // show 6 shimmer cards while loading
                itemBuilder: (context, index) => const ShimmerLoading(),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error : ${snapshot.error} "));
        }

        final book = snapshot.data!;

        final int maxBooks = 8; // Reduce to 8 for memory safety
        final booksToShow = book.length > maxBooks
            ? book.sublist(0, maxBooks)
            : book;

        return Container(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: booksToShow.length,
            itemBuilder: (context, index) {
              final books = booksToShow[index];
              return CardWidget(
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
      },
    );
  }
}
