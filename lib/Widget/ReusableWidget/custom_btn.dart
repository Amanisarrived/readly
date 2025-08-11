import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      left: 45.w,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 20, // Higher value = deeper shadow
          //     shadowColor: const Color(0xFFF59E0B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 100.w),
        ),
        child: Text(
          "Check Price",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),

      //  ElevatedButton(
      //   onPressed: onPressed,
      //   style: ElevatedButton.styleFrom(
      //     elevation: 20, // Higher value = deeper shadow
      //     shadowColor: const Color(0xFFF59E0B),
      //     backgroundColor: const Color(0xFFF59E0B),
      //     padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 120.w),
      //   ),
      //   child: const Text(
      //     "Add To Cart",
      //     style: TextStyle(fontSize: 14, color: Colors.white),
      //   ),
      // ),
    );
  }
}
