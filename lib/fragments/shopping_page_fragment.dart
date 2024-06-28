import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:eletronic_conponents_store/database/product_data.dart';

class ShoppingPageFragment extends StatefulWidget {
  final bool isLogin;
  const ShoppingPageFragment(this.isLogin, {super.key});

  @override
  State<ShoppingPageFragment> createState() => _ShoppingPageFragmentState();
}

class _ShoppingPageFragmentState extends State<ShoppingPageFragment> {
  final searchFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'SHOPPING',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        actions: <Widget>[
          widget.isLogin
              ? SizedBox(
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
                )
              : const SizedBox(),
        ],
      ),
      drawer: Drawer(
        width: 150.0,
        child: Column(
          children: <Widget>[
            const Text(
              'Loại sản phẩm',
              style: TextStyle(fontSize: 20.0),
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
        padding: const EdgeInsets.all(20.0),
        child: SearchableList<Product>(
          initialList: productList,
          inputDecoration: InputDecoration(
            labelText: "Tìm kiếm sản phẩm",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          filter: (query) {
            return productList
                .where((element) => element.name.contains(query))
                .toList();
          },
          itemBuilder: (Product product) {
            return ProductItem(product);
          },
          sortWidget: const Icon(Icons.sort),
          sortPredicate: (a, b) {
            return a.name.compareTo(b.name);
          },
        ),
      ),
    );
  }
}

List<Product> productList = [
  Product(id: 01, name: 'CPU', price: 100.0, description: 'Main core'),
  Product(id: 02, name: 'GPU', price: 200.0, description: 'Main graphic'),
];
