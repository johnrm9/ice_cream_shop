import 'package:flutter/material.dart';

import 'ice_cream.dart';

class ShopData extends ChangeNotifier {
  // list of items for sale
  final List<IceCream> _shop = <IceCream>[
    // chocoloate
    IceCream(
      name: 'Choco',
      imagePath: 'assets/images/chocolate.png',
      price: '4.00',
    ),

    // vanilla cone
    IceCream(
      name: 'Vanilla',
      imagePath: 'assets/images/cone.png',
      price: '8.50',
    ),

    // strawberry
    IceCream(
      name: 'Strawberry',
      imagePath: 'assets/images/strawberry.png',
      price: '5.50',
    ),

    // Watermelon
    IceCream(
      name: 'Watermelon',
      imagePath: 'assets/images/watermelon.png',
      price: '4.20',
    )
  ];

  // get items for sale
  List<IceCream> getShopItems() => _shop;

  // list of items in user cart
  final List<IceCream> _userCart = <IceCream>[];

  // get items in user cart
  List<IceCream> getUserCart() => _userCart;

  // add item to cart
  void addItemToCart(IceCream iceCream) {
    _userCart.add(iceCream);
    notifyListeners();
  }

  // delete item from cart
  void removeItemFromCart(IceCream iceCream) {
    _userCart.remove(iceCream);
    notifyListeners();
  }
}
