import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Service/book_service.dart';
import 'package:readly/Widget/ReusableWidget/card_widget.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_loading.dart';

class RomanceBookPreview extends StatefulWidget {
  const RomanceBookPreview({super.key});

  @override
  State<RomanceBookPreview> createState() => _RomanceBookPreviewState();
}

class _RomanceBookPreviewState extends State<RomanceBookPreview> {
  late Future<List<Book>> booksFuture;

  @override
  void initState() {
    super.initState();
    booksFuture = BookService().fetchRomanceBooks();
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

        return SizedBox(
          height: 265.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: book.length,
            itemBuilder: (context, index) {
              final books = book[index];

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
      },
    );
  }
}
