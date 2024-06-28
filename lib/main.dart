import 'package:eletronic_conponents_store/fragments/account_page_fragment.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solid Electronic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainPage(false),
      home: const AccountPageFragment(true),
    );
  }
}
