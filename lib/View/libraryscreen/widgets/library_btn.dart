import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryBtn extends StatelessWidget {
  const LibraryBtn({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Higher value = deeper shadow
        backgroundColor: const Color(0xFFF59E0B),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
      ),
      child: const Text(
        "Add To Cart",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
