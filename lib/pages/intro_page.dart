import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // logo
            Image.asset(
              'assets/images/cone.png',
              height: 300,
            ),

            const SizedBox(height: 48),

            // title
            Text(
              'Something Sweet?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.brown[700],
              ),
            ),

            const SizedBox(height: 24),

            // second title
            Text(
              'Get ice cream delivered straight to your door',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[400],
              ),
            ),

            const SizedBox(height: 48),

            // button
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<MaterialPageRoute<dynamic>>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown[500],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Enter Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
