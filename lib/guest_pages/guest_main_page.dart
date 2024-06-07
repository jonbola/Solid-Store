import 'package:flutter/material.dart';

class GuestMainPage extends StatefulWidget {
  const GuestMainPage({super.key});

  @override
  State<GuestMainPage> createState() => _GuestMainPageState();
}

bool isLogin = false;
int currentPage = 0;
final List<Widget> pages = [
  // const HomePage(),
  // const AccountPage(),
];

class _GuestMainPageState extends State<GuestMainPage> {
  void changePageFragment(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
