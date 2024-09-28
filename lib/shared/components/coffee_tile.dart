// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coffex/models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListTile(
        leading: Image.asset(coffee.imagePath),
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
