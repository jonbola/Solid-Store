import 'package:flutter/material.dart';

Function()? changeReturnablePage(
    BuildContext context, Function(BuildContext) build, Widget page) {
  return () =>
      Navigator.push(context, MaterialPageRoute(builder: (build) => page));
}
