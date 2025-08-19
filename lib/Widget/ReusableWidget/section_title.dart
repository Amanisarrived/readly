import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/View/viewallpage/presentation/viewall_screen.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    required this.actionText,
    required this.collectionName,

    super.key,
  });

  final String title;
  final String actionText;
  final String collectionName;

  void toNavigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ViewallScreen(genreName: title, collectionName: collectionName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 30.sp),
        ),

        TextButton(
          onPressed: () {
            toNavigate(context);
          },
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
