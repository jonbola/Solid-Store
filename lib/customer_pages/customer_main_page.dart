import 'package:eletronic_conponents_store/fragments/account_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/home_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/shopping_page_fragment.dart';
import 'package:flutter/material.dart';

class CustomerMainPage extends StatefulWidget {
  const CustomerMainPage({super.key});

  @override
  State<CustomerMainPage> createState() => _CustomerMainPageState();
}

class _CustomerMainPageState extends State<CustomerMainPage> {
  int currentPage = 0;
  final List<Widget> pages = [
    const HomePageFragment(),
    const ShoppingPageFragment(),
    const AccountPageFragment(),
  ];
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
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'resources/icons/ic_shopping.png',
                  width: 50.0,
                  height: 50.0,
                ),
                label: 'Shopping'),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Image.asset(
                'resources/icons/ic_account.png',
                width: 50.0,
                height: 50.0,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
