import 'package:eletronic_conponents_store/models/product.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final String language;
  const ProductCard(this.product, this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      language == 'VN'
                          ? 'Tên sản phẩm: ${product.name}'
                          : 'Product name: ${product.name}',
                      15,
                      FontStyle.normal,
                      FontWeight.bold,
                      blackColor,
                      Alignment.topLeft),
                  CustomText(
                      language == 'VN'
                          ? 'Loại sản phẩm: ${product.category}'
                          : 'Product category: ${product.category}',
                      15,
                      FontStyle.normal,
                      FontWeight.bold,
                      blackColor,
                      Alignment.topLeft),
                  CustomText(
                      language == 'VN'
                          ? 'Giá: ${product.price}'
                          : 'Price: ${product.price}',
                      15,
                      FontStyle.normal,
                      FontWeight.normal,
                      blackColor,
                      Alignment.topLeft),
                  CustomText(
                      language == 'VN'
                          ? 'Mô tả: ${product.description}'
                          : 'Description: ${product.description}',
                      15,
                      FontStyle.normal,
                      FontWeight.normal,
                      blackColor,
                      Alignment.topLeft),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
