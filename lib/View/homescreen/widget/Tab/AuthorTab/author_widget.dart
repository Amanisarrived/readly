import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/homescreen/widget/Tab/AuthorTab/agathaChristieBooks_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/AuthorTab/collenhover_books.dart';
import 'package:readly/View/homescreen/widget/Tab/AuthorTab/georgebook_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/AuthorTab/jkrowlingbook_builder.dart';
import 'package:readly/View/homescreen/widget/banner_widget.dart';
import 'package:readly/Widget/ReusableWidget/section_title.dart';
import 'package:readly/provider/genre_provider.dart';

class AuthorWidget extends StatefulWidget {
  const AuthorWidget({super.key});

  @override
  State<AuthorWidget> createState() => _AuthorWidgetState();
}

class _AuthorWidgetState extends State<AuthorWidget> {
  @override
  void initState() {
    super.initState();
    final genreProvider = Provider.of<GenreProvider>(context, listen: false);

    if (genreProvider.getBooksByGenre("colleenHover").isEmpty) {
      genreProvider.fetchBooksByGenre("colleenHover");
    }
    if (genreProvider.getBooksByGenre("jkrowling").isEmpty) {
      genreProvider.fetchBooksByGenre("jkrowling");
    }
    if (genreProvider.getBooksByGenre("george").isEmpty) {
      genreProvider.fetchBooksByGenre("george");
    }
    if (genreProvider.getBooksByGenre("agathaChristieBooks").isEmpty) {
      genreProvider.fetchBooksByGenre("agathaChristieBooks");
    }
  }

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    final colleenHover = genreProvider.getBooksByGenre("colleenHover");
    final jkrowling = genreProvider.getBooksByGenre("jkrowling");
    final george = genreProvider.getBooksByGenre("george");
    final agathaChristieBooks = genreProvider.getBooksByGenre(
      "agathaChristieBooks",
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            // 🔥 Static Image from Firebase Storage
            Container(
              width: 400.w,
              height: 150.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(92, 8, 21, 55).withAlpha(51),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const BannerWidget(
                  fileName: "author_poster (1).png",
                  folderName: "Author",
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // 🔤 Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Colleen Hover",
                actionText: "View All",
                collectionName: "colleenHover",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CollenhoverBooksBuilder(collenHoverbooks: colleenHover),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "JK Rowling",
                actionText: "View All",
                collectionName: "jkrowling",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Jkrowlingbookbuilder(jkrowling: jkrowling),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "George R.R.Martin",
                actionText: "View All",
                collectionName: "george",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: GeorgeBookBuilder(george: george),
            ),

            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Agatha Christie",
                actionText: "View All",
                collectionName: "agathaChristieBooks",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: AgathachristiebooksBuilder(
                agathaChristieBooks: agathaChristieBooks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
