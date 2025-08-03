import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/provider/state_provider.dart';

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
    final int bookCount = context.watch<AllStateProvider>().likedBooks.length;
    final int cartCount = context.watch<AllStateProvider>().cartBooks.length;

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
          selectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home, size: 25.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: badges.Badge(
                showBadge: bookCount > 0,
                badgeContent: Text(
                  '$bookCount',
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(6.sp),
                ),
                badgeAnimation: const badges.BadgeAnimation.fade(
                  animationDuration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: Icon(Iconsax.book_saved, size: 25.sp),
              ),
              label: "Library",
            ),
            BottomNavigationBarItem(
              icon: badges.Badge(
                showBadge: cartCount > 0,
                badgeContent: Text(
                  '$cartCount',
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(6.sp),
                ),
                badgeAnimation: const badges.BadgeAnimation.fade(
                  animationDuration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: Icon(Iconsax.shop_add, size: 25.sp),
              ),
              label: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
