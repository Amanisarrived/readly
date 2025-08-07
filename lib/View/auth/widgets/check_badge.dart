import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBadge extends StatelessWidget {
  const CheckBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer glow
          Container(
            width: 140.w,
            height: 150.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromARGB(204, 125, 79, 26), // 80% opacity
                  Color.fromARGB(26, 125, 79, 26), // 10% opacity
                ],
                stops: [0.6, 1.0],
              ),
            ),
          ),

          // Middle ring
          Container(
            width: 90.w,
            height: 100.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF986C40), // Dark brown
            ),
          ),

          // Inner ring
          Container(
            width: 70.w,
            height: 50.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE59100),
            ),
          ),

          Icon(Icons.check, size: 30.sp, color: Colors.white),
        ],
      ),
    );
  }
}
