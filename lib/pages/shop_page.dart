import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/ice_cream_tile.dart';
import '../models/ice_cream.dart';
import '../models/shop_data.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // add to cart
  void addToCart(IceCream iceCream) {
    // call add method
    Provider.of<ShopData>(context, listen: false).addItemToCart(iceCream);
    debugPrint('add method called');
    // let user know it has been added
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        backgroundColor: Colors.brown,
        title: Text(
          'Added to Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Consumer<ShopData>(
        builder: (BuildContext context, ShopData value, Widget? child) =>
            Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Something Sweet?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.brown[800],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.brown,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // search bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.brown[100],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.brown),
                    ),
                    Icon(Icons.search, color: Colors.brown),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // smooth dots
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: value.getShopItems().length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.brown.shade100,
                    activeDotColor: Colors.brown.shade500,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ice cream list
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: value.getShopItems().length,
                  itemBuilder: (BuildContext context, int index) {
                    // get each ice cream
                    final IceCream iceCream = value.getShopItems()[index];
                    return IceCreamTile(
                      iceCream: iceCream,
                      onPressed: () => addToCart(iceCream),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
