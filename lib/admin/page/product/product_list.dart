import 'package:flutter/material.dart';
import 'product_add.dart';
import 'product_data.dart'; // Ensure this is the correct import for ProductBuilder

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Center(
        child: ProductBuilder(
          key: UniqueKey(), // Ensure the widget is rebuilt
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to ProductAdd screen to add a new product
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductAdd(),
              fullscreenDialog: true,
            ),
          );

          // Refresh the ProductBuilder when returning from ProductAdd
          if (result == true) {
            setState(() {});
          }
        },
        tooltip: 'Add New',
        child: const Icon(Icons.add),
      ),
    );
  }
}
