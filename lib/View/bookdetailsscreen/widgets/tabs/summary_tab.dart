import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryTab extends StatefulWidget {
  const SummaryTab({required this.description, super.key});
  final String description;

  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  bool isExpanded = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: EdgeInsets.fromLTRB(
        20.w,
        20.h,
        20.w,
        80.h,
      ), // Add extra bottom padding
      child: LayoutBuilder(
        builder: (context, constraints) {
          final textSpan = TextSpan(
            text: widget.description,
            style: TextStyle(fontSize: 15.sp, color: const Color(0xFF747474)),
          );

          final tp = TextPainter(
            text: textSpan,
            maxLines: isExpanded ? null : 4,
            textDirection: TextDirection.ltr,
          );

          tp.layout(maxWidth: constraints.maxWidth);
          final bool isOverflowing = tp.didExceedMaxLines;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: Text(
                  widget.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF747474),
                  ),
                ),
                secondChild: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300.h),
                  child: SingleChildScrollView(
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFF747474),
                      ),
                    ),
                  ),
                ),
              ),
              if (isOverflowing)
                TextButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                    if (!isExpanded) return;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease,
                      );
                    });
                  },
                  child: Text(
                    isExpanded ? 'Show less' : 'Read more',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
