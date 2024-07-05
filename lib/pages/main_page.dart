import 'package:eletronic_conponents_store/fragments/account_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/home_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/shopping_page_fragment.dart';
import 'package:eletronic_conponents_store/tools/functions/change_vision_color.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final bool isLogin;
  final bool visionStatus;
  const MainPage(this.isLogin, this.visionStatus, {super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool login;
  late bool visionStatus;
  late Color mainColor;
  late Color backgroundColor;
  late Color textColor;
  late int currentPage;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    visionStatus = widget.visionStatus;
    login = widget.isLogin;
    var (color1, color2, color3) = setVisionColor(visionStatus);
    mainColor = color1;
    backgroundColor = color2;
    textColor = color3;
    currentPage = 0;
    pages = [
      HomePageFragment(login, visionStatus),
      ShoppingPageFragment(login, visionStatus),
      AccountPageFragment(login, visionStatus),
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
          onPressed: () => setState(() {
            var (status, color1, color2, color3) =
                changeVisionColor(visionStatus);
            visionStatus = status;
            mainColor = color1;
            backgroundColor = color2;
            textColor = color3;
          }),
          icon: Image.asset(
            'resources/icons/ic_light_bulb.png',
            width: 50.0,
            height: 50.0,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mainColor,
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
