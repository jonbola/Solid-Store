import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../database/model/product.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem(this.product, {super.key});
  // Function to decode base64 image string
  Uint8List decodeBase64(String base64String) {
    final base64StringCleaned =
        base64String.replaceFirst('data:image/jpeg;base64,', '');

    // Ensure base64 string length is a multiple of 4 by padding
    String base64StringWithPadding = base64StringCleaned;
    final padding = base64StringWithPadding.length % 4;
    if (padding > 0) {
      base64StringWithPadding += '=' * (4 - padding);
    }

    return base64Decode(base64StringWithPadding);
  }

  @override
  Widget build(BuildContext context) {
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
                        : product.img.startsWith('http') ||
                                product.img.startsWith('https')
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
                      product.productName
                          .substring(0, 1), // Display first letter of the name
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
                  Text("Price: ${product.price} VND",
                      style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
