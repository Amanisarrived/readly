import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Widget/BookdetailTabs/chapter_tab.dart';
import 'package:readly/Widget/BookdetailTabs/review_tab.dart';
import 'package:readly/Widget/BookdetailTabs/summary_tab.dart';

class BookDetailsTab extends StatelessWidget {
  const BookDetailsTab({required this.description, super.key});
  final String description;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            dividerColor: const Color.fromARGB(48, 89, 89, 89),
            indicatorAnimation: TabIndicatorAnimation.elastic,
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(fontSize: 15.sp),

            tabs: const [
              Tab(text: "Summary"),
              Tab(text: "Chapters"),
              Tab(text: "Reviews"),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                SummaryTab(description: description),
                const ChapterTab(),
                const ReviewTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
