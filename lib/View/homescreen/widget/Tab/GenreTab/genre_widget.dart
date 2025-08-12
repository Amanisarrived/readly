import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/dramabook_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/fantasybook_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/romancebook_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/selfhelo_book_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/thrillerbook_builder.dart';
import 'package:readly/View/homescreen/widget/banner_widget.dart';
import 'package:readly/Widget/ReusableWidget/section_title.dart';
import 'package:readly/provider/genre_provider.dart';

class GenreWidget extends StatefulWidget {
  const GenreWidget({super.key});

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  void initState() {
    super.initState();
    final genreProvider = Provider.of<GenreProvider>(context, listen: false);

    if (genreProvider.getBooksByGenre("fantasy").isEmpty) {
      genreProvider.fetchBooksByGenre("fantasy");
    }
    if (genreProvider.getBooksByGenre("romance").isEmpty) {
      genreProvider.fetchBooksByGenre("romance");
    }
    if (genreProvider.getBooksByGenre("thriller").isEmpty) {
      genreProvider.fetchBooksByGenre("thriller");
    }
    if (genreProvider.getBooksByGenre("drama").isEmpty) {
      genreProvider.fetchBooksByGenre("drama");
    }
    if (genreProvider.getBooksByGenre("selfhelp").isEmpty) {
      genreProvider.fetchBooksByGenre("selfhelp");
    }
  }

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    final fantasyBook = genreProvider.getBooksByGenre("fantasy");
    final romanceBooks = genreProvider.getBooksByGenre("romance");
    final thillerBooks = genreProvider.getBooksByGenre("thriller");
    final dramaBooks = genreProvider.getBooksByGenre("drama");
    final selfhelp = genreProvider.getBooksByGenre("selfhelp");

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            // 🔥 Static Image from Firebase Storage
            Container(
              width: 390.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff081537).withAlpha(80),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const BannerWidget(
                folderName: "Genre",
                fileName: "genre_poster.png",
              ),
            ),

            SizedBox(height: 18.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Self Help",
                actionText: "View All",
                collectionName: "selfhelp",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: SelfHeloBookBuilder(selfhelpbooks: selfhelp),
            ),

            // 🔤 Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Fantasy",
                actionText: "View All",
                collectionName: "fantasy",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: FantasybookBuilder(fantasyBook: fantasyBook),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Romance",
                actionText: "View All",
                collectionName: "romance",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: RomancebookBuilder(romanceBook: romanceBooks),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Thriller/Fantacy",
                actionText: "View All",
                collectionName: "thriller",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: ThrillerbookBuilder(thrillerBooks: thillerBooks),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Drama",
                actionText: "View All",
                collectionName: "drama",
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: DramaBookBuilder(dramabook: dramaBooks),
            ),
          ],
        ),
      ),
    );
  }
}
