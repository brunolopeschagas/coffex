import 'package:coffex/models/coffee.dart';
import 'package:coffex/models/coffee_shop.dart';
import 'package:coffex/shared/components/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                'Your cart',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];
                    return CartTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee, context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeFromCart(Coffee coffee, BuildContext context) {
    CoffeeShop coffeeShop = Provider.of<CoffeeShop>(context, listen: false);
    coffeeShop.removeItemFromCart(coffee);
  }
}
