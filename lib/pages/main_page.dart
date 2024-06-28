import 'package:eletronic_conponents_store/fragments/account_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/home_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/shopping_page_fragment.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final bool isLogin;
  const MainPage(this.isLogin, {super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    pages = [
      HomePageFragment(widget.isLogin),
      ShoppingPageFragment(widget.isLogin),
      AccountPageFragment(widget.isLogin),
    ];
  }

  void changePageFragment(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        floatingActionButton: IconButton(
          onPressed: null,
          icon: Image.asset(
            'resources/icons/ic_arrow_up.png',
            width: 50.0,
            height: 50.0,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: changePageFragment,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'resources/icons/ic_home.png',
                width: 50.0,
                height: 50.0,
              ),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'resources/icons/ic_search.png',
                  width: 50.0,
                  height: 50.0,
                ),
                label: 'Tìm kiếm'),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Image.asset(
                'resources/icons/ic_account.png',
                width: 50.0,
                height: 50.0,
              ),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
    );
  }
}
