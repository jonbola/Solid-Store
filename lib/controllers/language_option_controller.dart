import 'package:flutter/material.dart';

class LanguageOptionController extends ChangeNotifier {
  String language = 'VN';
  String get languageOption => language;

  set languageOption(value) {
    language = value;
    notifyListeners();
  }
}
