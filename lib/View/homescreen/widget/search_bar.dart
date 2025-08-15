import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.onChnaged});

  final void Function(String) onChnaged;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(
                color: Theme.of(context).cardColor,
                width: 2.w,
              ),
            ),
            alignment: Alignment.center,
            child: TextField(
              onChanged: widget.onChnaged,
              textAlign: TextAlign.start, // 👈 Center text input
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 30.w,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: "Search by book title or genre",
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 15.sp),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).cardColor, width: 2),
          ),
          child: Icon(
            Iconsax.notification,
            size: 26,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
