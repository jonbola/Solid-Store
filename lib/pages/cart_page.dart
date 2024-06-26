import 'package:eletronic_conponents_store/fragments/product_item_fragment.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
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
          backgroundColor: lightBlueColor,
          title: const CustomText('GIỎ HÀNG', 30.0, FontStyle.normal,
              FontWeight.bold, whiteColor, Alignment.center),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const CustomText('Danh sách sản phẩm', 20.0, FontStyle.normal,
                  FontWeight.normal, blackColor, Alignment.centerLeft),
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
                      CustomText('Tổng tiền: ', 20.0, FontStyle.normal,
                          FontWeight.normal, blackColor, Alignment.centerRight),
                      CustomText('0' + ' VNĐ', 20.0, FontStyle.normal,
                          FontWeight.normal, blackColor, Alignment.centerRight),
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
                        backgroundColor: WidgetStatePropertyAll(blueColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(true),
                          ),
                        );
                      },
                      child: const CustomText(
                          'Tiếp tục mua sắm',
                          20.0,
                          FontStyle.normal,
                          FontWeight.normal,
                          whiteColor,
                          Alignment.center),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(blueColor),
                    ),
                    onPressed: null,
                    child: CustomText('Thanh toán', 20.0, FontStyle.normal,
                        FontWeight.normal, whiteColor, Alignment.center),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
