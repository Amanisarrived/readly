import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      left: 40.w,

      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 20, // Higher value = deeper shadow
          shadowColor: const Color(0xFFF59E0B),
          backgroundColor: const Color(0xFFF59E0B),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 120.w),
        ),
        child: const Text(
          "Add To Cart",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
