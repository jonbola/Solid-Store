import 'package:eletronic_conponents_store/tools/values/color_values.dart';

List changeVisionColor(bool status) {
  if (status) {
    return [false, orangeColor, greyColor, whiteColor];
  } else {
    return [true, lightBlueColor, whiteColor, blackColor];
  }
}
