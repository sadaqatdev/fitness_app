import 'package:flutter/material.dart';

extension onBuildContext on BuildContext {
  Size getScreenSize() {
    return MediaQuery.of(this).size;
  }

  TextTheme getTextTheme() {
    return Theme.of(this).textTheme;
  }

  TextStyle getTextStyle() {
    return getTextTheme().bodyLarge!;
  }
}
