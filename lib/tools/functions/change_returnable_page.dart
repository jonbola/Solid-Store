import 'package:flutter/material.dart';

void changeReturnablePage(
    BuildContext context, Function(BuildContext) build, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (build) => page));
}
