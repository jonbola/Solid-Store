import 'package:eletronic_conponents_store/pages/Login/login_page.dart';
import 'package:eletronic_conponents_store/tools/functions/change_non_returnable_page.dart';
import 'package:flutter/material.dart';
import 'package:eletronic_conponents_store/admin/page/homewidget.dart';
import 'package:eletronic_conponents_store/admin/page/category/category_list.dart';
import 'package:eletronic_conponents_store/admin/page/product/product_list.dart';
import 'package:eletronic_conponents_store/admin/page/account/admin_register.dart';

class AdminMainpage extends StatefulWidget {
  const AdminMainpage({super.key});

  @override
  State<AdminMainpage> createState() => _MainpageState();
}

class _MainpageState extends State<AdminMainpage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    CategoryList(),
    ProductList()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Admin Widget"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  _selectedIndex = 0;
                  setState(() {});
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Register'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminSigninPage()),
                  );
                },
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: changeNonReturnablePage(
                    context, build, const LoginPage(false)),
              ),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Product',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 11, 7, 233),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
