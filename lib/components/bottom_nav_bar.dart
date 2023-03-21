import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.onTabChange});
  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: GNav(
          padding: const EdgeInsets.all(20),
          color: Colors.brown[300],
          activeColor: Colors.brown[100],
          tabBackgroundColor: Colors.brown.shade400,
          // tabActiveBorder: Border.all(color: Colors.brown.shade100),
          tabBorderRadius: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          gap: 8,
          onTabChange: (int value) => onTabChange!(value),
          tabs: const <GButton>[
            GButton(
              icon: Icons.icecream,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: 'Cart',
            ),
          ],
        ),
      );
}
