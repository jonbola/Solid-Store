import 'package:flutter/material.dart';

class HomePageFragment extends StatelessWidget {
  const HomePageFragment({super.key});

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
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Image.asset('resources/images/img_logo.png'),
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
                  icon: Image.asset('resources/icons/ic_search.png'),
                ),
              ),
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  const Row(
                    children: [
                      Text(
                        'Loại sản phẩm',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          TextButton(
                            onPressed: null,
                            child: Text('RAM'),
                          ),
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
                            child: Text('Mainboard'),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text('Màn hình'),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text('Chuột'),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text('Bàn phím'),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text('Web Cam'),
                          ),
                        ],
                      )
                    ],
                  ),
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
                    child: Row(
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
                      'Sale',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: Row(
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
                    child: Row(
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
