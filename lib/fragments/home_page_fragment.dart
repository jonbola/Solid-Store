import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:eletronic_conponents_store/tools/components.dart';
import 'package:eletronic_conponents_store/tools/values/string_style.dart';

class HomePageFragment extends StatefulWidget {
  final bool isLogin;
  const HomePageFragment(this.isLogin, {super.key});

  @override
  State<HomePageFragment> createState() => _HomePageFragmentState();
}

class _HomePageFragmentState extends State<HomePageFragment> {
  late List<String> imageList;
  @override
  void initState() {
    super.initState();
    imageList = <String>[
      'resources/images_product/img_cpu_product.png',
      'resources/images_product/img_gpu_product.png',
      'resources/images_product/img_ram_product.png'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          titleSpacing: -10.0,
          title: Row(
            children: <Widget>[
              Image.asset(
                'resources/images/img_logo.png',
                height: 70.0,
                width: 70.0,
              ),
              const Text(
                'Solid Electronic',
                style: blackBody,
              ),
            ],
          ),
          actions: widget.isLogin
              ? <Widget>[
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      icon: Image.asset('resources/icons/ic_shopping_cart.png'),
                    ),
                  ),
                ]
              : <Widget>[
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      icon: Image.asset('resources/icons/ic_exit.png'),
                    ),
                  ),
                ],
        ),
        drawer: Drawer(
          width: 150.0,
          child: Column(
            children: <Widget>[
              const Text(
                'Loại sản phẩm',
                style: blackText,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    TextButton(
                      onPressed: null,
                      child: Text('CPU'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('GPU'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('RAM'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('HDD'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('SSD'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('Chuột'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('Màn hình'),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text('Vỏ case'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              const LeftText('Sản phẩm bán chạy', blackText),
              HorizontalListView(imageList),
              const SizedBox(
                height: 20.0,
              ),
              const LeftText('Khuyến mãi', blackText),
              HorizontalListView(imageList),
              const SizedBox(
                height: 20.0,
              ),
              const LeftText('Sản phẩm mới', blackText),
              HorizontalListView(imageList),
            ],
          ),
        ),
      ),
    );
  }
}
