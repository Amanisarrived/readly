import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.onChnaged,
    required this.controller,
  });

  final void Function(String) onChnaged;
  final TextEditingController controller;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool showClear = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        showClear = widget.controller.text.isNotEmpty;
      });
    });
  }

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
              controller: widget.controller,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: widget.onChnaged,
              textInputAction: TextInputAction.search,
              onChanged: widget.onChnaged,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: 15.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 20.w,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Icon(
                    Icons.search,
                    size: 26,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                suffixIcon: showClear
                    ? IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () {
                          widget.controller.clear();
                          widget.onChnaged('');
                          setState(() => showClear = false);
                        },
                      )
                    : null,
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
