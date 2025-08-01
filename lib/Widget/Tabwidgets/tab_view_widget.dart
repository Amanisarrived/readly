import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Widget/Tabwidgets/AllTab/all_widget.dart';
import 'package:readly/Widget/Tabwidgets/AuthorTab/author_widget.dart';
import 'package:readly/Widget/Tabwidgets/Freetab/free_widget.dart';
import 'package:readly/Widget/Tabwidgets/GenreTab/genre_widget.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SizedBox(
        height: 700.h,
        child: Column(
          children: [
            /// Tab Bar on top
            TabBar(
              physics: const NeverScrollableScrollPhysics(),
              labelColor: Theme.of(context).hintColor,
              unselectedLabelColor: Theme.of(context).hintColor,
              labelPadding: EdgeInsets.symmetric(horizontal: 1.w),
              dividerColor: Colors.transparent,
              indicatorColor: Theme.of(context).primaryColor,
              indicator: MaterialIndicator(
                color: Theme.of(context).primaryColor,
                height: 4.h,
                topLeftRadius: 8.r,
                topRightRadius: 8.r,
                bottomLeftRadius: 8.r,
                bottomRightRadius: 8.r,
              ),
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Genre"),
                Tab(text: "Author"),
                Tab(text: "Free"),
              ],
            ),

            /// Tab View should take full remaining height
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  AllWidget(),
                  GenreWidget(),
                  AuthorWidget(),
                  FreeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
