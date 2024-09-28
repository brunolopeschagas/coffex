// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffex/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class MyBottonNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottonNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.all(25),
        child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.grey[700],
          tabBackgroundColor: Colors.grey.shade300,
          tabBorderRadius: 24,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: [
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: value.userCart.isEmpty
                  ? 'Shop'
                  : 'Shop +${value.userCart.length}',
            ),
            const GButton(
              icon: Icons.add_shopping_cart,
              text: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
