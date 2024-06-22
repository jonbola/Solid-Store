import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

extension StringValidate on String {
  bool isEmailValidate() {
    if (contains('@gmail.com')) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordLong() {
    if (length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordStrong() {
    if (regexString.hasMatch(this) &&
        regexNumber.hasMatch(this) &&
        regexSpecialChar.hasMatch(this) &&
        isPasswordLong()) {
      return true;
    } else {
      return false;
    }
  }

  bool isOnlyText() {
    if (!regexString.hasMatch(this) &&
        !regexNumber.hasMatch(this) &&
        !regexSpecialChar.hasMatch(this)) {
      return true;
    } else {
      return false;
    }
  }

  bool isOnlyNumber() {
    if (regexNumber.hasMatch(this) &&
        !regexString.hasMatch(this) &&
        !regexSpecialChar.hasMatch(this)) {
      return true;
    } else {
      return false;
    }
  }

  bool isOnlySpecialChar() {
    if (regexSpecialChar.hasMatch(this) &&
        !regexString.hasMatch(this) &&
        !regexNumber.hasMatch(this)) {
      return true;
    } else {
      return false;
    }
  }
}

final RegExp regexString = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
final RegExp regexNumber = RegExp(r'^(?=.*?[0-9])');
final RegExp regexSpecialChar = RegExp(r'^(?=.*?[!@#\$&*~])');
