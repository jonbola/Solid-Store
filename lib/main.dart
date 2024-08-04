import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eletronic_conponents_store/database/model/cart.dart';
import 'package:eletronic_conponents_store/database/helper/orderprovier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await DatabaseHelper().deleteDatabaseFile(); // Call this to delete the database file
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
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(
            create: (context) => OrderProvider()..fetchOrders()),
      ],
      child: Consumer<DarkModeController>(
        builder: (context, darkMode, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Solid Electronic',
          theme: ThemeData(
              scaffoldBackgroundColor: setVisionColor(darkMode.status)[1]),
          home: const MainPage(false, false),
        ),
      ),
    );
  }
}
