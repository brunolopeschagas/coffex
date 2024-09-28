import 'package:coffex/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'black',
      price: '22',
      imagePath: 'lib/images/coffex_logo.jpeg',
    ),
    Coffee(
      name: 'milked',
      price: '12',
      imagePath: 'lib/images/coffex_logo.jpeg',
    ),
    Coffee(
      name: 'late',
      price: '44',
      imagePath: 'lib/images/coffex_logo.jpeg',
    ),
  ];

  final List<Coffee> _userCart = [];
  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
