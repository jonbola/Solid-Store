import 'package:flutter/material.dart';

class CustomerShoppingPageFragment extends StatelessWidget {
  const CustomerShoppingPageFragment({super.key});

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
              icon: Image.asset('resources/icons/ic_search.png'),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: Image.asset('resources/icons/ic_shopping_cart.png'),
            ),
          ),
        ],
      ),
    );
  }
}