import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/homescreen/widget/Tab/AllTab/books_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/AllTab/trendingbook_builder.dart';
import 'package:readly/Widget/ReusableWidget/section_title.dart';
import 'package:readly/provider/genre_provider.dart';

class AllWidget extends StatefulWidget {
  const AllWidget({super.key});

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> {
  @override
  void initState() {
    super.initState();

    final genreProvider = Provider.of<GenreProvider>(context, listen: false);
    genreProvider.fetchBooksByGenre("books");
    genreProvider.fetchBooksByGenre("trending");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GenreProvider>(
      builder: (context, genreProvider, child) {
        final books = genreProvider.getBooksByGenre("books");

        final trendingBooks = genreProvider.getBooksByGenre("trending");

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: const SectionTitle(
                    title: "New Arrivals",
                    actionText: "ViewAll",
                    collectionName: "books",
                  ),
                ),
                books.isEmpty
                    ? const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : BooksBuilder(newBooks: books),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: const SectionTitle(
                    title: "Trending",
                    actionText: "ViewAll",
                    collectionName: "trending",
                  ),
                ),
                SizedBox(height: 5.h),
                trendingBooks.isEmpty
                    ? const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : TrendingbookBuilder(trendingBooks: trendingBooks),
              ],
            ),
          ),
        );
      },
    );
  }
}
