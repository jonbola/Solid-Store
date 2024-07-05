import 'package:flutter/material.dart';

Function()? changeNonReturnablePage(
    BuildContext context, Function(BuildContext) build, Widget page) {
  return () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (build) => page),
      );
}
