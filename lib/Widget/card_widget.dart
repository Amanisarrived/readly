import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/View/book_details.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.author,
    required this.imageurl,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.description,
    super.key,
  });

  final String imageurl;
  final String title;
  final String author;
  final String releaseDate;
  final String rating;
  final String description;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isClicked = false;

  void changeIcon() {
    setState(() {
      isClicked = !isClicked;
    });
  }

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
                border: BoxBorder.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  width: 3,
                ),
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
                      color: Colors.black.withOpacity(
                        0.1,
                      ), // subtle black shadow
                      blurRadius: 6,
                      offset: Offset(2, 2), // slight bottom-right shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: isClicked
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  child: IconButton(
                    onPressed: changeIcon,
                    icon: Icon(
                      Iconsax.like_1,
                      color: isClicked
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
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Color(0xFF595959)),
          ),
        ],
      ),
    );
  }
}
