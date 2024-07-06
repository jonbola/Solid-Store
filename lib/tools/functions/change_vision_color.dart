import 'package:eletronic_conponents_store/tools/values/color_values.dart';

// (bool, Color, Color, Color) changeVisionColor(bool status) {
//   if (status) {
//     return (false, orangeColor, greyColor, whiteColor);
//   } else {
//     return (true, lightBlueColor, whiteColor, blackColor);
//   }
// }
List changeVisionColor(bool status) {
  if (status) {
    return [false, orangeColor, greyColor, whiteColor];
  } else {
    return [true, lightBlueColor, whiteColor, blackColor];
  }
}
