import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ReleaseDetails extends StatelessWidget {
  const ReleaseDetails({
    required this.rating,
    required this.releaseDate,
    super.key,
  });

  final String releaseDate;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Released",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 116, 116, 116),
                    ),
                  ),
                  Text(
                    "Rating",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 116, 116, 116),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 185.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 18.w),
                    child: Text(
                      releaseDate,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 116, 116, 116),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          rating,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 116, 116, 116),
                              ),
                        ),
                      ),
                      SizedBox(width: 3.w),

                      Padding(
                        padding: EdgeInsets.only(bottom: 6.h),
                        child: Icon(
                          Iconsax.star5,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
