import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/homescreen/widget/Tab/Freetab/free_romance_builder.dart';
import 'package:readly/View/homescreen/widget/banner_widget.dart';
import 'package:readly/Widget/ReusableWidget/section_title.dart';
import 'package:readly/provider/genre_provider.dart';

class FreeWidget extends StatefulWidget {
  const FreeWidget({super.key});

  @override
  State<FreeWidget> createState() => _FreeWidgetState();
}

class _FreeWidgetState extends State<FreeWidget> {
  @override
  void initState() {
    super.initState();
    final genreProvider = Provider.of<GenreProvider>(context, listen: false);

    if (genreProvider.getBooksByGenre("freebooks").isEmpty) {
      genreProvider.fetchBooksByGenre("freebooks");
    }
  }

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    final freebooks = genreProvider.getBooksByGenre("freebooks");
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
                borderRadius: BorderRadius.circular(0),
                child: const BannerWidget(
                  fileName: "free_banner.png",
                  folderName: "Free",
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // 🔤 Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const SectionTitle(
                title: "Free Books",
                actionText: "View All",
                collectionName: "freebooks",
              ),
            ),

            // 📚 Book preview
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: FreeRomacneBuilder(freebooks: freebooks),
            ),

            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
