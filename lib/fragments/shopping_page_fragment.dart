import 'package:flutter/material.dart';

class ShoppingPageFragment extends StatefulWidget {
  final bool isLogin;
  const ShoppingPageFragment(this.isLogin, {super.key});

  @override
  State<ShoppingPageFragment> createState() => _ShoppingPageFragmentState();
}

class _ShoppingPageFragmentState extends State<ShoppingPageFragment> {
  late bool isVisible;
  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  void setVisible() {
    setState(() {
      if (!isVisible) {
        isVisible = true;
      } else {
        isVisible = false;
      }
    });
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
          SizedBox(
            child: IconButton(
              onPressed: () {
                setVisible();
              },
              icon: Image.asset('resources/icons/ic_search.png'),
            ),
          ),
          widget.isLogin
              ? SizedBox(
                  child: IconButton(
                    onPressed: null,
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
        child: Column(
          children: <Widget>[
            Visibility(
              visible: isVisible,
              child: const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Danh sách sản phẩm',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
