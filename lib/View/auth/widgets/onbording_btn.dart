import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbordingBtn extends StatelessWidget {
  const OnbordingBtn({
    required this.textcolor,
    required this.btntext,
    required this.onTap,
    super.key,
  });

  final String btntext;
  final Color textcolor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 100.w),
      ),
      child: Text(
        btntext,
        style: TextStyle(
          color: textcolor,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
