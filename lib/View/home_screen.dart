import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/Widget/bottom_navigation.dart';
import 'package:readly/Widget/search_bar.dart';
import 'package:readly/Widget/tab_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Hello, User !",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(width: 10.w),
                Icon(Iconsax.user_tick4, size: 23.sp),
              ],
            ),
            SizedBox(height: 20.h),

            SearchBarWidget(),

            SizedBox(height: 20.h),

            Expanded(child: TabViewWidget()),
          ],
        ),
      ),
    );
  }
}
