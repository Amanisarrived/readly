import 'package:flutter/material.dart';
import 'package:readly/View/cart_view.dart';
import 'package:readly/View/home_screen.dart';
import 'package:readly/View/library_view.dart';
import 'package:readly/Widget/CustomWidget/bottom_navigation.dart';

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
