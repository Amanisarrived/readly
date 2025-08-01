import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/View/book_details.dart';
import 'package:readly/provider/state_provider.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.author,
    required this.imageurl,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.description,
    required this.book,
    super.key,
  });

  final String imageurl;
  final String title;
  final String author;
  final String releaseDate;
  final String rating;
  final String description;
  final Book book;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void toDetailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookDetails(
          author: widget.author,
          imageUrl: widget.imageurl,
          title: widget.title,
          releaseDate: widget.releaseDate,
          rating: widget.rating,
          description: widget.description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<AllStateProvider>(context, listen: true);
    final isLiked = stateProvider.isBookLiked(widget.book);

    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: toDetailScreen,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 169.h,
              width: 117.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(widget.imageurl, width: 200.w),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 90.w,
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: isLiked
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  child: IconButton(
                    onPressed: () {
                      if (isLiked) {
                        stateProvider.removeBook(widget.book);
                      } else {
                        stateProvider.addBook(widget.book);
                      }
                    },
                    icon: Icon(
                      size: isLiked ? 20.sp : 18.sp,
                      Iconsax.like_1,
                      color: isLiked
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.author,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Color(0xFF595959)),
          ),
        ],
      ),
    );
  }
}
