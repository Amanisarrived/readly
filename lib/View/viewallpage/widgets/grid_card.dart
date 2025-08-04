import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/View/bookdetailsscreen/presentation/book_details.dart';
import 'package:readly/provider/state_provider.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    required this.book,
    required this.title,
    required this.imageUrl,
    required this.author,
    super.key,
  });
  final String imageUrl;
  final String title;
  final String author;
  final Book book;

  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<AllStateProvider>(context, listen: true);
    final isLiked = stateProvider.isBookLiked(book);
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookDetails(
                  author: author,
                  imageUrl: imageUrl,
                  title: title,
                  releaseDate: book.releaseDate,
                  rating: book.rating,
                  description: book.description,
                  book: book,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            height: 169.h,
            width: 125.w,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10.r),
              child: Image.network(imageUrl, width: 200.w, fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80.w,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
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
                      stateProvider.removeBook(book);
                    } else {
                      stateProvider.addBook(book);
                    }
                  },
                  icon: Icon(
                    size: isLiked ? 20.r : 18.r,
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
          author,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color(0xFF595959),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
