import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_dropdown_menu.dart';
import 'package:eletronic_conponents_store/tools/components/custom_icon_button.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text_button.dart';
import 'package:eletronic_conponents_store/tools/components/custom_textfield.dart';
import 'package:eletronic_conponents_store/tools/functions/change_returnable_page.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/en_string_values.dart';
import 'package:eletronic_conponents_store/tools/values/vn_string_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPageFragment extends StatefulWidget {
  final bool isLogin;
  const AccountPageFragment(this.isLogin, {super.key});

  @override
  State<AccountPageFragment> createState() => _AccountPageFragmentState();
}

class _AccountPageFragmentState extends State<AccountPageFragment> {
  late bool login;
  late bool isEnabled;
  late bool isVisible;
  late DarkModeController darkModeController;

  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    isEnabled = false;
    isVisible = false;
    darkModeController = context.read<DarkModeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DarkModeController, LanguageOptionController>(
      builder: (context, darkMode, language, child) => login
          ? Scaffold(
              appBar: AppBar(
                backgroundColor: setVisionColor(darkMode.status)[0],
                toolbarHeight: 100.0,
                titleSpacing: -10.0,
                leading: Visibility(
                  visible: isVisible,
                  child: CustomIconButton(
                    70.0,
                    70.0,
                    Alignment.centerLeft,
                    Image.asset('resources/icons/ic_cancel.png'),
                    () => setState(() {
                      isVisible = false;
                      isEnabled = false;
                    }),
                  ),
                ),
                title: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      language.language == 'VN' ? 'TÀI KHOẢN' : 'ACCOUNT',
                      30.0,
                      FontStyle.normal,
                      FontWeight.bold,
                      whiteColor,
                      Alignment.center),
                ),
                actions: <Widget>[
                  Visibility(
                    visible: isVisible,
                    child: CustomIconButton(
                      70.0,
                      70.0,
                      Alignment.centerRight,
                      Image.asset('resources/icons/ic_check.png'),
                      () => setState(() {
                        isVisible = false;
                        isEnabled = false;
                      }),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          CustomIconButton(
                            170.0,
                            170.0,
                            Alignment.center,
                            Image.asset('resources/images/img_logo.png'),
                            null,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 200.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CustomText(
                                    language.language == 'VN'
                                        ? 'Tên tài khoản'
                                        : 'Account name',
                                    20.0,
                                    FontStyle.normal,
                                    FontWeight.bold,
                                    setVisionColor(darkMode.status)[2],
                                    Alignment.centerLeft),
                                CustomTextfield(
                                  200.0,
                                  50.0,
                                  isEnabled,
                                  language.language == 'VN'
                                      ? 'Tên tài khoản'
                                      : 'Account name',
                                  setVisionColor(darkMode.status)[2],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        child: FittedBox(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 200.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                        'Email',
                                        20.0,
                                        FontStyle.normal,
                                        FontWeight.bold,
                                        setVisionColor(darkMode.status)[2],
                                        Alignment.centerLeft),
                                    CustomTextfield(
                                      200.0,
                                      50.0,
                                      isEnabled,
                                      'Email',
                                      setVisionColor(darkMode.status)[2],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              SizedBox(
                                width: 200.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                        language.language == 'VN'
                                            ? 'Số điện thoại'
                                            : 'Phone number',
                                        20.0,
                                        FontStyle.normal,
                                        FontWeight.bold,
                                        setVisionColor(darkMode.status)[2],
                                        Alignment.centerLeft),
                                    CustomTextfield(
                                      200.0,
                                      50.0,
                                      isEnabled,
                                      language.language == 'VN'
                                          ? 'Số điện thoại'
                                          : 'Phone number',
                                      setVisionColor(darkMode.status)[2],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        child: FittedBox(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 200.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                        language.language == 'VN'
                                            ? 'Họ'
                                            : 'Lastname',
                                        20.0,
                                        FontStyle.normal,
                                        FontWeight.bold,
                                        setVisionColor(darkMode.status)[2],
                                        Alignment.centerLeft),
                                    CustomTextfield(
                                      200.0,
                                      50.0,
                                      isEnabled,
                                      language.language == 'VN'
                                          ? 'Họ'
                                          : 'Lastname',
                                      setVisionColor(darkMode.status)[2],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              SizedBox(
                                width: 200.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                        language.language == 'VN'
                                            ? 'Tên'
                                            : 'Firstname',
                                        20.0,
                                        FontStyle.normal,
                                        FontWeight.bold,
                                        setVisionColor(darkMode.status)[2],
                                        Alignment.centerLeft),
                                    CustomTextfield(
                                      200.0,
                                      50.0,
                                      isEnabled,
                                      language.language == 'VN'
                                          ? 'Tên'
                                          : 'Firstname',
                                      setVisionColor(darkMode.status)[2],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        child: FittedBox(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 150.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                        language.language == 'VN'
                                            ? 'Giới tính'
                                            : 'Gender',
                                        20.0,
                                        FontStyle.normal,
                                        FontWeight.bold,
                                        setVisionColor(darkMode.status)[2],
                                        Alignment.centerLeft),
                                    CustomDropdownMenu(
                                        isEnabled,
                                        language.language == 'VN'
                                            ? vnGenderList
                                            : enGenderList,
                                        150.0),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              SizedBox(
                                width: 250.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomText(
                                        language.language == 'VN'
                                            ? 'Quốc tịch'
                                            : 'Nation',
                                        20.0,
                                        FontStyle.normal,
                                        FontWeight.bold,
                                        setVisionColor(darkMode.status)[2],
                                        Alignment.centerLeft),
                                    CustomDropdownMenu(
                                        isEnabled,
                                        language.language == 'VN'
                                            ? vnCountryList
                                            : enCountryList,
                                        250.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextButton(
                        250.0,
                        50.0,
                        setVisionColor(darkMode.status)[0],
                        CustomText(
                            language.language == 'VN'
                                ? 'Thay đổi thông tin'
                                : 'Change profile',
                            20.0,
                            FontStyle.normal,
                            FontWeight.normal,
                            whiteColor,
                            Alignment.center),
                        () => setState(() {
                          isEnabled = true;
                          isVisible = true;
                        }),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextButton(
                        150.0,
                        50.0,
                        setVisionColor(darkMode.status)[0],
                        CustomText(
                            language.language == 'VN' ? 'Đăng xuất' : 'Log out',
                            20.0,
                            FontStyle.normal,
                            FontWeight.normal,
                            whiteColor,
                            Alignment.center),
                        changeReturnablePage(
                          context,
                          build,
                          MainPage(false, darkMode.status),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                      language.language == 'VN'
                          ? 'Đăng nhập để sử dụng'
                          : 'Log in to use',
                      20.0,
                      FontStyle.normal,
                      FontWeight.normal,
                      setVisionColor(darkMode.status)[2],
                      Alignment.center),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextButton(
                    150.0,
                    50.0,
                    setVisionColor(darkMode.status)[0],
                    CustomText(
                        language.language == 'VN' ? 'Đăng nhập' : 'Log in',
                        20.0,
                        FontStyle.normal,
                        FontWeight.normal,
                        whiteColor,
                        Alignment.center),
                    changeReturnablePage(
                      context,
                      build,
                      LoginPage(darkMode.status),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
