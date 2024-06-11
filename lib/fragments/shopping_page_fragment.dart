import 'package:flutter/material.dart';

class GuestShoppingPageFragment extends StatefulWidget {
  const GuestShoppingPageFragment({super.key});

  @override
  State<GuestShoppingPageFragment> createState() =>
      _GuestShoppingPageFragmentState();
}

class _GuestShoppingPageFragmentState extends State<GuestShoppingPageFragment> {
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
        ],
      ),
    );
  }
}
