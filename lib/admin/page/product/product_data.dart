import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../database/model/product.dart';
import '../../../database/helper/db_helper.dart';
import 'product_add.dart';

class ProductBuilder extends StatefulWidget {
  const ProductBuilder({Key? key}) : super(key: key);

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<ProductModel>> _getProducts() async {
    return await _databaseHelper.getAllProducts() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No products available'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final itemProd = snapshot.data![index];
              return _buildProduct(itemProd, context);
            },
          ),
        );
      },
    );
  }

  // Function to decode base64 image string
  Uint8List decodeBase64(String base64String) {
    final base64StringCleaned = base64String.replaceFirst('data:image/jpeg;base64,', '');

    // Ensure base64 string length is a multiple of 4 by padding
    String base64StringWithPadding = base64StringCleaned;
    final padding = base64StringWithPadding.length % 4;
    if (padding > 0) {
      base64StringWithPadding += '=' * (4 - padding);
    }

    return base64Decode(base64StringWithPadding);
  }

  Future<void> _confirmDelete(BuildContext context, ProductModel product) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false when canceled
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true when confirmed
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      await _databaseHelper.deleteProduct(product.productId!);
      setState(() {}); // Refresh the list after deletion
    }
  }

  Widget _buildProduct(ProductModel product, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.0, // Size of the image container
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[300],
                image: product.img.isNotEmpty
                    ? (product.img.startsWith('data:image/')
                        ? DecorationImage(
                            image: MemoryImage(decodeBase64(product.img)),
                            fit: BoxFit.cover,
                          )
                        : product.img.startsWith('http') || product.img.startsWith('https')
                            ? DecorationImage(
                                image: NetworkImage(product.img),
                                fit: BoxFit.cover,
                                onError: (error, stackTrace) {
                                  print('Error loading image: $error');
                                  // Optionally set a placeholder image or handle the error
                                },
                              )
                            : null)
                    : null,
              ),
              alignment: Alignment.center,
              child: product.img.isEmpty
                  ? Text(
                      product.productName.substring(0, 1), // Display first letter of the name
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text("Price: ${product.price} VND" ,style: TextStyle(color: Colors.red),),
                  const SizedBox(height: 4.0),
                  Text("Stock: ${product.stockQuantity}" ,style: TextStyle(color: Color.fromARGB(255, 224, 163, 43)),),
                  const SizedBox(height: 4.0),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                await _confirmDelete(context, product);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () async {
                await Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (_) => ProductAdd(
                          isUpdate: true,
                          productModel: product,
                        ),
                        fullscreenDialog: true,
                      ),
                    )
                    .then((_) => setState(() {})); // Refresh the list after updating
              },
              icon: Icon(
                Icons.edit,
                color: Colors.yellow.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}