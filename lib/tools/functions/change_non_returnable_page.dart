import 'package:flutter/material.dart';

void changeNonReturnablePage(
    BuildContext context, Function(BuildContext) build, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (build) => page),
  );
}
