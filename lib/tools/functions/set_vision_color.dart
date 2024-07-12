import 'package:eletronic_conponents_store/tools/values/color_values.dart';

List setVisionColor(bool status) {
  if (status) {
    return [orangeColor, greyColor, whiteColor];
  } else {
    return [lightBlueColor, whiteColor, blackColor];
  }
}
