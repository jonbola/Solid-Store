import 'package:flutter/material.dart';

class ShoppingPageFragment extends StatefulWidget {
  const ShoppingPageFragment({super.key});

  @override
  State<ShoppingPageFragment> createState() => _ShoppingPageFragmentState();
}

class _ShoppingPageFragmentState extends State<ShoppingPageFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SHOPPING',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: Image.asset('resources/ic/ic_search.png'),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: Image.asset('resources/ic/ic_shopping_cart.png'),
            ),
          ),
        ],
      ),
    );
  }
}
