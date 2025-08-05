import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(endIndent: 5.w, indent: 20.w),
        ),
        const Text("Or", style: TextStyle(color: Colors.grey)),
        Expanded(
          child: Divider(endIndent: 20.w, indent: 5.w),
        ),
      ],
    );
  }
}
