import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    required this.onTabSelected,
    required this.selectedIndex,
    super.key,
  });
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFFFBFBFB),
          currentIndex: widget.selectedIndex,
          onTap: widget.onTabSelected,
          selectedItemColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Iconsax.book), label: "Library"),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shop_add),
              label: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
