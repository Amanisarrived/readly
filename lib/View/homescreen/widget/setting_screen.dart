import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/auth/presentation/login_screen.dart';
import 'package:readly/View/homescreen/widget/logout_alert.dart';
import 'package:readly/View/homescreen/widget/setting_card.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_name_loading.dart';
import 'package:readly/provider/auth_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<AuthProvider>(context, listen: false).loadEmailOrName(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              CircleAvatar(
                radius: 42.r,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.white,
                  child: Icon(Iconsax.user, size: 35.sp),
                ),
              ),
              Gap(10.h),
              authProvider.emailOrName == null
                  ? ShimmerNameLoading(width: 100.w, height: 10.h)
                  : Text(
                      authProvider.emailOrName!,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              Gap(40.h),

              const SettingCard(),

              Gap(20.h),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => LogoutDialog(
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onConfirm: () async {
                        final sucess = await authProvider.signOut();
                        if (sucess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
                child: Container(
                  width: 320.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withAlpha(20),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Icon(Iconsax.logout4, size: 25.sp, color: Colors.red),
                        Gap(10.w),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
