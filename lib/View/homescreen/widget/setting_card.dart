import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/View/homescreen/widget/about_us.dart';
import 'package:readly/View/homescreen/widget/help_and_support.dart';
import 'package:readly/View/homescreen/widget/privacy_policy.dart';
import 'package:readly/View/homescreen/widget/setting_tile.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            children: [
              Text(
                "Support",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Gap(12.h),

        Container(
          width: 320.w,
          height: 160.h,
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
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SettingTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HelpAndSupport()),
                    );
                  },
                  icon: Iconsax.support,
                  title: "Help and support",
                  tralingIcon: Icons.arrow_right,
                ),

                Gap(20.h),

                SettingTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                    );
                  },
                  icon: Iconsax.building,
                  title: "About Us",
                  tralingIcon: Icons.arrow_right,
                ),

                Gap(20.h),

                SettingTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                  icon: Iconsax.security_safe1,
                  title: "Privacy Policy",
                  tralingIcon: Icons.arrow_right,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
