import 'package:flutter/material.dart';

import '../models/ice_cream.dart';

class IceCreamTile extends StatelessWidget {
  const IceCreamTile({
    super.key,
    required this.iceCream,
    required this.onPressed,
  });
  final IceCream iceCream;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 48),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24),
              child: Image.asset(
                iceCream.imagePath,
                height: 160,
              ),
            ),
            const SizedBox(height: 24),
            Column(
              children: <Widget>[
                Text(
                  iceCream.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${iceCream.price}',
                  style: TextStyle(color: Colors.brown[400]),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
}
