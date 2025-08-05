import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TextFeild extends StatelessWidget {
  const TextFeild({
    required this.obsureText,
    required this.feildtitle,
    required this.hinttext,
    this.icon,
    this.iconBtn,
    this.keyboardtype,
    super.key,
  });

  final String feildtitle;
  final bool obsureText;
  final Widget? icon;
  final String hinttext;
  final void Function()? iconBtn;
  final TextInputType? keyboardtype;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feildtitle,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            Gap(5.h),
            TextFormField(
              keyboardType: keyboardtype,
              obscureText: obsureText,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.black),
              decoration: InputDecoration(
                suffixIcon: icon,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusColor: Colors.black,
                hintText: hinttext,
                hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 14.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
