import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  bool _visionStatus = true;
  bool get visionStatus => _visionStatus;
  set visionStatus(value) {
    _visionStatus = value;
    notifyListeners();
  }
}
