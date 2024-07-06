import 'package:eletronic_conponents_store/tools/values/color_values.dart';

// (Color, Color, Color) setVisionColor(bool status) {
//   if (status) {
//     return (lightBlueColor, whiteColor, blackColor);
//   } else {
//     return (orangeColor, greyColor, whiteColor);
//   }
// }

List setVisionColor(bool status) {
  if (status) {
    return [lightBlueColor, whiteColor, blackColor];
  } else {
    return [orangeColor, greyColor, whiteColor];
  }
}
