import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkModeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageOptionController(),
        ),
      ],
      child: Consumer<DarkModeController>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Solid Electronic',
          theme: ThemeData(
              scaffoldBackgroundColor: setVisionColor(value.status)[1]),
          home: const MainPage(false, false),
        ),
      ),
    );
  }
}
