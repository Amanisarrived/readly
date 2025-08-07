import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/fantasybook_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/romancebook_builder.dart';
import 'package:readly/View/homescreen/widget/Tab/GenreTab/thrillerbook_builder.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    final fantasyBook = genreProvider.getBooksByGenre("fantasy");
    final romanceBooks = genreProvider.getBooksByGenre("romance");
    final thillerBooks = genreProvider.getBooksByGenre("thriller");

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
                child: Image.network(
                  // ✅ Your manually uploaded image URL
                  "https://firebasestorage.googleapis.com/v0/b/shoppinglist-823a2.firebasestorage.app/o/posters%2Fgenre_banner.png?alt=media&token=47475698-aad9-4d21-a59e-81b91bb3cc41",
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SizedBox(height: 10.h),

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
          ],
        ),
      ),
    );
  }
}
