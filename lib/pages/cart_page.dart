import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ice_cream.dart';
import '../models/shop_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove from cart
  void removeFromCart(IceCream iceCream) {
    Provider.of<ShopData>(context, listen: false).removeItemFromCart(iceCream);
  }

  // pay now button tapped
  void payNow() {
    debugPrint('Pay now button tapped.');
  }

  @override
  Widget build(BuildContext context) => Consumer<ShopData>(
        builder: (BuildContext context, ShopData value, Widget? child) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              Text(
                'My Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 15),

              // list of cart items

              if (value.getUserCart().isEmpty)
                const Expanded(
                  child: Center(
                    child: Text(
                      'Cart is empty..',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (BuildContext context, int index) {
                      // get each ice cream in cart
                      final IceCream iceCream = value.getUserCart()[index];

                      // return list tile
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(iceCream.imagePath),
                          ),
                          title: Text(
                            iceCream.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[700],
                            ),
                          ),
                          subtitle: Text(
                            '\$${iceCream.price}',
                            style: TextStyle(
                              color: Colors.brown[400],
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => removeFromCart(iceCream),
                          ),
                        ),
                      );
                    },
                  ),
                ),

              // pay button

              GestureDetector(
                onTap: payNow,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
