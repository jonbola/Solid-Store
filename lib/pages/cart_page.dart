import 'package:eletronic_conponents_store/fragments/product_item_fragment.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
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
                  children: const <Widget>[
                    ProductItemFragment(
                        'resources/images_product/img_cpu_product.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 100.0,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200.0,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Tổng tiền: ',
                        style: blackText,
                      ),
                      Text(
                        '0' + ' VNĐ',
                        style: blackText,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(true),
                          ),
                        );
                      },
                      child: const Text(
                        'Tiếp tục mua sắm',
                        style: whiteText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(blue),
                    ),
                    onPressed: null,
                    child: Text(
                      'Thanh toán',
                      style: whiteText,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
