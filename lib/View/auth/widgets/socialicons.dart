import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Socialicons extends StatelessWidget {
  const Socialicons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 70,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: BoxBorder.all(color: Colors.grey),
            ),
            child: Image.asset("assets/images/google.png"),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 70,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: BoxBorder.all(color: Colors.grey),
            ),
            child: Image.asset("assets/images/facebook.png"),
          ),
        ),
      ],
    );
  }
}
