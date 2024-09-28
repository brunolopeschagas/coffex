import 'package:coffex/models/coffee.dart';
import 'package:coffex/models/coffee_shop.dart';
import 'package:coffex/shared/components/cart_tile.dart';
import 'package:coffex/shared/consts.dart';
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Your cart',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total:   ',
                      style: TextStyle(
                        color: lightTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ ${value.totalSale.toString()}',
                      style: TextStyle(
                        color: lightTextColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => pay(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            value.userCart.isEmpty
                                ? Row(
                                    children: [
                                      Text(
                                        'Done ',
                                        style: TextStyle(
                                            color: lightTextColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Icon(Icons.add_reaction),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        'Pay ',
                                        style: TextStyle(
                                            color: lightTextColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Icon(Icons.payment),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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

  void pay(BuildContext context) {
    CoffeeShop coffeeShop = Provider.of<CoffeeShop>(context, listen: false);
    coffeeShop.closeSale();
  }
}
