import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbordingBtn extends StatelessWidget {
  const OnbordingBtn({
    required this.textcolor,
    required this.btntext,
    required this.onTap,
    this.isloading = false,
    super.key,
  });

  final String btntext;
  final Color textcolor;
  final void Function() onTap;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isloading ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 100.w),
      ),
      child: isloading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(
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
