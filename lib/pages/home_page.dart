import 'package:coffex/pages/cart_page.dart';
import 'package:coffex/pages/shop_page.dart';
import 'package:coffex/shared/components/botton_navigation_bar.dart';
import 'package:coffex/shared/consts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffex'),
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottonNavBar(
        onTabChange: (index) => navigateBottonBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }

  void navigateBottonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
