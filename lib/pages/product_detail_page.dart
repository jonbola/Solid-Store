import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:flutter/material.dart';
import 'package:eletronic_conponents_store/pages/login_page.dart';

class ProductDetailPage extends StatefulWidget {
  final bool isLogin;
  const ProductDetailPage(this.isLogin, {super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  ItemProduct('resources/images_product/img_cpu_product.png'),
                  ItemProduct('resources/images_product/img_cpu_product.png'),
                  ItemProduct('resources/images_product/img_cpu_product.png'),
                  ItemProduct('resources/images_product/img_cpu_product.png'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  CustomText('Tên sản phẩm', 30.0, FontStyle.normal,
                      FontWeight.bold, blackColor, Alignment.centerLeft),
                  CustomText('Mô tả', 30.0, FontStyle.normal, FontWeight.bold,
                      blackColor, Alignment.centerLeft),
                  CustomText('Mô tả', 20.0, FontStyle.normal, FontWeight.normal,
                      blackColor, Alignment.centerLeft),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 100.0,
          child: widget.isLogin
              ? Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 90.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        ),
                        child: const CustomText(
                            'Thêm vào giỏ hàng',
                            20.0,
                            FontStyle.normal,
                            FontWeight.normal,
                            whiteColor,
                            Alignment.center),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 90.0),
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                        icon:
                            Image.asset('resources/icons/ic_shopping_cart.png'),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    ),
                    child: const CustomText('Đăng nhập', 20.0, FontStyle.normal,
                        FontWeight.normal, whiteColor, Alignment.center),
                  ),
                ),
        ),
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final String imageDic;
  const ItemProduct(this.imageDic, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      width: 150.0,
      child: Image.asset(imageDic),
    );
  }
}
