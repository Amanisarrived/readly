import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/Widget/allwidget/bottom_navigation.dart';
import 'package:readly/Widget/allwidget/search_bar.dart';
import 'package:readly/Widget/allwidget/tab_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Text(
                    "Hello, User !",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(width: 10.w),
                  Icon(Iconsax.user_tick4, size: 23.sp),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SearchBarWidget(),
            ),

            SizedBox(height: 20.h),

            Expanded(child: TabViewWidget()),
          ],
        ),
      ),
    );
  }
}
