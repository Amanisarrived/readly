import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnboardTagline extends StatelessWidget {
  const OnboardTagline({
    required this.subtitle,
    required this.title,
    required this.icon,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 45.w,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[50],
          ),
          child: icon,
        ),
        Gap(15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(1.h),

              Text(
                maxLines: 2, // Optional: limit lines
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color.fromARGB(255, 141, 141, 141),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
