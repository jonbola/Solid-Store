import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../database/model/product.dart';
import '../../../pages/Login/login_page.dart';
import '../../../tools/components/custom_text.dart';
import '../../../tools/values/color_values.dart';
import '../database/model/cart.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final bool isLogin;
  final bool isDarkModeOn;
  const ProductDetailPage(this.product, this.isLogin, this.isDarkModeOn,
      {super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late bool login;
  late bool darkMode;

  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    darkMode = widget.isDarkModeOn;
  }

  Uint8List decodeBase64(String base64String) {
    final base64StringCleaned =
        base64String.replaceFirst('data:image/jpeg;base64,', '');
    String base64StringWithPadding = base64StringCleaned;
    final padding = base64StringWithPadding.length % 4;
    if (padding > 0) {
      base64StringWithPadding += '=' * (4 - padding);
    }
    return base64Decode(base64StringWithPadding);
  }

  void _addToCart() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final cartItem = CartItem(
      id: widget.product.productId.toString(), // Use 'productId' here
      image: widget.product.img.startsWith('data:image/')
          ? decodeBase64(widget.product.img).toString()
          : widget.product.img,
      productName: widget.product.productName,
      price: widget.product.price,
    );
    cartProvider.addItem(cartItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Container(
              decoration: const BoxDecoration(color: lightBlueColor),
              child:
                  Text('${widget.product.productName} đã được thêm giỏ hàng'))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(product.productName),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    if (product.img.isNotEmpty)
                      ItemProduct(
                        image: product.img.startsWith('data:image/')
                            ? MemoryImage(decodeBase64(product.img))
                            : product.img.startsWith('http') ||
                                    product.img.startsWith('https')
                                ? NetworkImage(product.img)
                                : const AssetImage(
                                        'resources/images_product/img_cpu_product.png')
                                    as ImageProvider,
                      )
                    else
                      const ItemProduct(
                          image: AssetImage(
                                  'resources/images_product/img_cpu_product.png')
                              as ImageProvider),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomText('Tên sản phẩm', 30.0, FontStyle.normal,
                        FontWeight.bold, blackColor, Alignment.centerLeft),
                    CustomText(product.productName, 20.0, FontStyle.normal,
                        FontWeight.normal, blackColor, Alignment.centerLeft),
                    const SizedBox(height: 10.0),
                    const CustomText('Mô tả', 30.0, FontStyle.normal,
                        FontWeight.bold, blackColor, Alignment.centerLeft),
                    CustomText(
                        product.description ?? 'No description available',
                        20.0,
                        FontStyle.normal,
                        FontWeight.normal,
                        blackColor,
                        Alignment.centerLeft),
                    const SizedBox(height: 10.0),
                    const CustomText('Giá', 30.0, FontStyle.normal,
                        FontWeight.bold, blackColor, Alignment.centerLeft),
                    CustomText('${product.price} VND', 20.0, FontStyle.normal,
                        FontWeight.normal, blackColor, Alignment.centerLeft),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70.0, // Reduce the height
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: widget.isLogin
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 40.0, // Set the height of the button
                        child: TextButton(
                          onPressed: _addToCart, // Add to cart functionality
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                            padding: WidgetStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(8.0)), // Adjust padding
                          ),
                          child: const CustomText(
                              'Thêm vào giỏ hàng',
                              20.0, // Adjust text size
                              FontStyle.normal,
                              FontWeight.normal,
                              whiteColor,
                              Alignment.center),
                        ),
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
                          builder: (context) =>
                              LoginPage(darkMode), // Pass necessary parameters
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
  final ImageProvider image;
  const ItemProduct({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      width: 150.0,
      child: Image(image: image),
    );
  }
}
