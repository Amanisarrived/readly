import 'package:flutter/material.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Repo/book_service.dart';
import 'package:readly/Widget/card_widget.dart';

class BooksPreview extends StatefulWidget {
  const BooksPreview({super.key});

  @override
  State<BooksPreview> createState() => _BooksPreviewState();
}

class _BooksPreviewState extends State<BooksPreview> {
  late Future<List<Book>> booksFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booksFuture = BookService().fetchNewArrivals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error : ${snapshot.error} "));
        }

        final book = snapshot.data!;

        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: book.length,
            itemBuilder: (context, index) {
              final books = book[index];

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
