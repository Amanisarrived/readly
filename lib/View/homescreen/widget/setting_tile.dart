import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.icon,
    required this.title,
    required this.tralingIcon,
    super.key,
  });

  final IconData icon;
  final String title;
  final IconData tralingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 25.sp, color: const Color(0xff595959)),
        Gap(10.w),
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Icon(tralingIcon, size: 25.sp, color: Theme.of(context).primaryColor),
      ],
    );
  }
}
