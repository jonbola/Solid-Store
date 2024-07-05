import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:flutter/material.dart';

// void changeVisionColor(bool status, Color theme1, Color theme2, Color theme3) {
//   if (status) {
//     status = false;
//     theme1 = orangeColor;
//     theme2 = greyColor;
//     theme3 = whiteColor;
//   } else {
//     status = true;
//     theme1 = lightBlueColor;
//     theme2 = whiteColor;
//     theme3 = blackColor;
//   }
// }

(bool, Color, Color, Color) changeVisionColor(bool status) {
  if (status) {
    return (false, orangeColor, greyColor, whiteColor);
  } else {
    return (true, lightBlueColor, whiteColor, blackColor);
  }
}
