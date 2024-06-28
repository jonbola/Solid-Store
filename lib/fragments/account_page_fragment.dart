import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_dropdown_menu.dart';
import 'package:eletronic_conponents_store/tools/components/custom_icon_button.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text_button.dart';
import 'package:eletronic_conponents_store/tools/components/custom_textfield.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/object_values.dart';
import 'package:flutter/material.dart';

class AccountPageFragment extends StatefulWidget {
  final bool isLogin;
  const AccountPageFragment(this.isLogin, {super.key});

  @override
  State<AccountPageFragment> createState() => _AccountPageFragmentState();
}

class _AccountPageFragmentState extends State<AccountPageFragment> {
  late bool isEnabled;
  late bool isVisible;
  @override
  void initState() {
    super.initState();
    isEnabled = false;
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.isLogin
          ? Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Visibility(
                          visible: isVisible,
                          child: CustomIconButton(
                              70.0, 70.0, Alignment.centerLeft, setState(() {
                            isVisible = false;
                          }), Image.asset('resources/icons/ic_cancel.png')),
                        ),
                        const Spacer(),
                        const CustomText('TÀI KHOẢN', 30.0, FontStyle.normal,
                            FontWeight.bold, blackColor, Alignment.center),
                        const Spacer(),
                        Visibility(
                          visible: isVisible,
                          child: CustomIconButton(
                              70.0, 70.0, Alignment.centerRight, setState(() {
                            isVisible = false;
                          }), Image.asset('resources/icons/ic_check.png')),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        CustomIconButton(
                          170.0,
                          170.0,
                          Alignment.center,
                          null,
                          Image.asset('resources/images/img_logo.png'),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 200.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const CustomText(
                                  'Tên tài khoản',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomTextfield(
                                  200.0, 50.0, isEnabled, 'Tên tài khoản'),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 200.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const CustomText(
                                  'Email',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomTextfield(200.0, 50.0, isEnabled, 'Email'),
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
                              const CustomText(
                                  'Số điện thoại',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomTextfield(
                                  200.0, 50.0, isEnabled, 'Số điện thoại'),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 200.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const CustomText(
                                  'Họ',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomTextfield(200.0, 50.0, isEnabled, 'Họ'),
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
                              const CustomText(
                                  'Tên',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomTextfield(200.0, 50.0, isEnabled, 'Tên'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 150.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const CustomText(
                                  'Giới tính',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomDropdownMenu(isEnabled, genderList, 150.0),
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
                              const CustomText(
                                  'Quốc tịch',
                                  20.0,
                                  FontStyle.normal,
                                  FontWeight.bold,
                                  blackColor,
                                  Alignment.centerLeft),
                              CustomDropdownMenu(isEnabled, countryList, 250.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextButton(
                      250.0,
                      50.0,
                      lightBlueColor,
                      const CustomText('Thay đổi thông tin', 20.0, FontStyle.normal, FontWeight.normal, whiteColor, Alignment.center),
                      setState(() {
                        isEnabled = true;
                        isVisible = true;
                      }),
                    ),
                  ],
                ),
                //       SizedBox(
                //         width: 200.0,
                //         height: 50.0,
                //         child: TextButton(
                //           style: const ButtonStyle(
                //             backgroundColor:
                //                 WidgetStatePropertyAll(Colors.blue),
                //           ),
                //           onPressed: () {
                //             setState(() {
                //               isEnabled = true;
                //             });
                //           },
                //           child: const Text(
                //             'Thay đổi thông tin',
                //             style:
                //                 TextStyle(fontSize: 20.0, color: Colors.white),
                //           ),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20.0,
                //       ),
                //       SizedBox(
                //         width: 150.0,
                //         height: 50.0,
                //         child: TextButton(
                //           style: const ButtonStyle(
                //             backgroundColor:
                //                 WidgetStatePropertyAll(Colors.blue),
                //           ),
                //           onPressed: () {
                //             Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const MainPage(false)),
                //             );
                //           },
                //           child: const Text(
                //             'Đăng xuất',
                //             style:
                //                 TextStyle(fontSize: 20.0, color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            )
          : Scaffold(
              body: Container(
                margin: const EdgeInsets.only(left: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Đăng nhập để tiếp tục sử dụng',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
