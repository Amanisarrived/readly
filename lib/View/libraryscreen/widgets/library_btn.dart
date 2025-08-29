import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Model/book_card.dart';

class LibraryBtn extends StatelessWidget {
  const LibraryBtn({required this.onPressed, super.key, required this.book});

  final void Function() onPressed;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Higher value = deeper shadow
        backgroundColor: const Color(0xFFF59E0B),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
      ),
      child: Text(
        book.isFree ? "Read" : "Add to cart",
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
