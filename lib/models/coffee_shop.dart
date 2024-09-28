import 'package:coffex/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  double _totalSale = 0;
  bool _doneSale = false;

  final List<Coffee> _shop = [
    Coffee(
      name: 'black',
      price: 4.99,
      imagePath: 'lib/images/coffex_logo.jpeg',
    ),
    Coffee(
      name: 'milked',
      price: 5.99,
      imagePath: 'lib/images/coffex_logo.jpeg',
    ),
    Coffee(
      name: 'late',
      price: 9.99,
      imagePath: 'lib/images/coffex_logo.jpeg',
    ),
  ];

  final List<Coffee> _userCart = [];
  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;
  double get totalSale => _totalSale;
  bool get doneSale => _doneSale;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    _calculateTotalSale();
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    _calculateTotalSale();
    notifyListeners();
  }

  void _calculateTotalSale() {
    _totalSale = _userCart.fold(0, (sum, coffee) => sum + coffee.price);
  }

  void closeSale() {
    _doneSale = true;
    _clear();
    notifyListeners();
  }

  void _clear() {
    _userCart.clear();
    _totalSale = 0;
  }
}
