import 'package:flutter/material.dart';

class DarkModeController extends ChangeNotifier {
  bool status = false;
  bool get darkModeStatus => status;

  set darkModeOn(value) {
    status = value;
    notifyListeners();
  }
}
