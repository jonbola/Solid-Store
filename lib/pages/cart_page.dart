import 'package:eletronic_conponents_store/fragments/product_item_fragment.dart';
import 'package:eletronic_conponents_store/tools/components.dart';
import 'package:eletronic_conponents_store/tools/values/colors.dart';
import 'package:eletronic_conponents_store/tools/values/string_style.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lightBlue,
          title: const MiddleText('GIỎ HÀNG', whiteHead),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const LeftText('Danh sách sản phẩm', blackBody),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ProductItemFragment('resources/images_product/img_cpu_product.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
