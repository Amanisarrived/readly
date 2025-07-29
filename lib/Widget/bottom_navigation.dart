import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/View/home_screen.dart';
import 'package:readly/Widget/BottomTabs/cart.dart';
import 'package:readly/Widget/BottomTabs/library.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(), // You can replace this with Home() later
    Library(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Render selected screen here
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Iconsax.book), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Iconsax.shop_add), label: "Cart"),
        ],
      ),
    );
  }
}
