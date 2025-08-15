import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/homescreen/widget/setting_screen.dart';
import 'package:readly/View/homescreen/widget/search_bar.dart'
    show SearchBarWidget;
import 'package:readly/View/homescreen/widget/Tab/tab_view_widget.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_name_loading.dart';
import 'package:readly/provider/auth_provider.dart';
import 'package:readly/provider/state_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.isFirstTimeUser) {
        // Show notification permission prompt only once on first login

        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SettingsScreen();
          },
        );

        // After user responds, flag is already cleared in Firestore & provider
      }
      Provider.of<AllStateProvider>(context, listen: false).loadUserBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<AuthProvider>(context).userName;
    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                userName == null
                    ? ShimmerNameLoading(width: 90.w, height: 18.h)
                    : Text(
                        "Hello $userName",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                SizedBox(width: 10.w),
                Icon(Iconsax.user_tick4, size: 23.sp),
                const Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[50],
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Iconsax.setting_2,
                      size: 23.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: SearchBarWidget(onChnaged: (value) {}),
          ),

          SizedBox(height: 20.h),

          const Expanded(child: TabViewWidget()),
        ],
      ),
    );
  }
}
