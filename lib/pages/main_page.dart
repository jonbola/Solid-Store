import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/fragments/account_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/home_page_fragment.dart';
import 'package:eletronic_conponents_store/fragments/search_page_fragment.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/functions/change_language.dart';
import 'package:eletronic_conponents_store/tools/functions/change_vision_color.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final bool isLogin;
  final bool isDarkModeOn;
  const MainPage(this.isLogin, this.isDarkModeOn, {super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool login;
  late bool darkMode;
  late String languageOption;
  late Color mainColor;
  late Color backgroundColor;
  late Color textColor;
  late int currentPage;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDarkModeOn;
    languageOption = 'VN';
    login = widget.isLogin;
    final setColor = setVisionColor(darkMode);
    mainColor = setColor[0];
    backgroundColor = setColor[1];
    textColor = setColor[2];
    currentPage = 0;
    pages = [
      HomePageFragment(login),
      SearchPageFragment(login),
      AccountPageFragment(login),
    ];
  }

  void changePageFragment(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DarkModeController, LanguageOptionController>(
      builder: (context, mode, language, child) => SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: currentPage,
            children: pages,
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                backgroundColor: whiteColor,
                onPressed: () => setState(() {
                  final changeLanguage = changeLanguageOption(languageOption);
                  context.read<LanguageOptionController>().languageOption =
                      changeLanguage;
                  languageOption = changeLanguage;
                }),
                child: CustomText(language.language, 20.0, FontStyle.normal,
                    FontWeight.normal, blackColor, Alignment.center),
              ),
              const SizedBox(
                height: 20.0,
              ),
              FloatingActionButton(
                heroTag: null,
                backgroundColor: whiteColor,
                onPressed: () => setState(() {
                  final changeColor = changeVisionColor(darkMode);
                  context.read<DarkModeController>().darkModeOn =
                      changeColor[0];
                  darkMode = changeColor[0];
                }),
                child: Image.asset(
                  'resources/icons/ic_light_bulb.png',
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: setVisionColor(mode.status)[0],
            currentIndex: currentPage,
            onTap: changePageFragment,
            unselectedItemColor: whiteColor,
            selectedItemColor: whiteColor,
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
      ),
    );
  }
}
