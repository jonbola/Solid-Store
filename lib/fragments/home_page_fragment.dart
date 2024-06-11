import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePageFragment extends StatelessWidget {
  final bool isLogin;
  const HomePageFragment(this.isLogin, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppBar(
            toolbarHeight: 120.0,
            title: Row(
              children: <Widget>[
                Image.asset(
                  'resources/images/img_logo.png',
                  height: 100.0,
                  width: 100.0,
                ),
                const Text(
                  'Solid Electronic',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            actions: isLogin
                ? <Widget>[
                    SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: IconButton(
                        onPressed: null,
                        icon:
                            Image.asset('resources/icons/ic_shopping_cart.png'),
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
                                builder: (context) => const LoginPage()),
                          );
                        },
                        icon: Image.asset('resources/icons/ic_exit.png'),
                      ),
                    ),
                  ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sản phẩm bán chạy',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Image.asset(
                            'resources/images_product/img_cpu_product.png'),
                        Image.asset(
                            'resources/images_product/img_gpu_product.png'),
                        Image.asset(
                            'resources/images_product/img_ram_product.png'),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Khuyến mãi',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Image.asset(
                            'resources/images_product/img_cpu_product.png'),
                        Image.asset(
                            'resources/images_product/img_gpu_product.png'),
                        Image.asset(
                            'resources/images_product/img_ram_product.png'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Sản phẩm mới',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Image.asset(
                            'resources/images_product/img_cpu_product.png'),
                        Image.asset(
                            'resources/images_product/img_gpu_product.png'),
                        Image.asset(
                            'resources/images_product/img_ram_product.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GuestAppBarFragment extends StatelessWidget {
  const GuestAppBarFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppBar(
            toolbarHeight: 120.0,
            title: Row(
              children: <Widget>[
                Image.asset(
                  'resources/images/img_logo.png',
                  height: 100.0,
                  width: 100.0,
                ),
                const Text(
                  'Solid Electronic',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            actions: <Widget>[
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  icon: Image.asset('resources/icons/ic_exit.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerAppBarFragment extends StatelessWidget {
  const CustomerAppBarFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 120.0,
            title: Row(
              children: <Widget>[
                Image.asset(
                  'resources/images/img_logo.png',
                  height: 100.0,
                  width: 100.0,
                ),
                const Text(
                  'Solid Electronic',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            actions: <Widget>[
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: IconButton(
                  onPressed: null,
                  icon: Image.asset('resources/icons/ic_shopping_cart.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
