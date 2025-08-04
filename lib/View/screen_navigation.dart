import 'package:flutter/material.dart';
import 'package:readly/View/cartscreen/presentation/cart_view.dart';
import 'package:readly/View/homescreen/presentation/home_screen.dart';
import 'package:readly/View/libraryscreen/library_view.dart';
import 'package:readly/View/homescreen/widget/bottom_navigation.dart';
import 'package:readly/View/viewallpage/presentation/viewall_screen.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({super.key});

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LibraryView(),
    const CartView(),
    const ViewallScreen(collectionName: "", genreName: ""),
  ];

  void _onSelectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTabSelected: _onSelectedTab,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
