import 'package:coffex/models/coffee.dart';
import 'package:coffex/models/coffee_shop.dart';
import 'package:coffex/shared/components/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('how do you like your coffee?'),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = value.coffeeShop[index];
                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => addToCart(eachCoffee),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Coffee added to the cart'),
        actions: <Widget>[
          TextButton(
            child: const Text('Oks'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
