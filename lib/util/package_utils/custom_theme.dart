import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme extends Theme {
  //Primary Blue: #335C81 (51, 92, 129)
  //Light Blue:   #74B3CE (116, 179, 206)
  //Yellow:       #FCA311 (252, 163, 17)
  //Red:          #E15554 (255, 85, 84)
  //Green:        #3BB273 (59, 178, 115)

  static Color blueDark = const Color.fromRGBO(51, 92, 129, 1);
  static Color blueLight = const Color.fromRGBO(116, 179, 206, 1);
  static Color yellow = const Color.fromRGBO(252, 163, 17, 1);
  static Color red = const Color.fromRGBO(225, 85, 84, 1);
  static Color green = const Color.fromRGBO(59, 178, 115, 1);

  CustomTheme(Widget child, {Key? key})
      : super(key: key,
    child: child,
    data: ThemeData(
      primaryColor: blueDark,
      cardColor: blueLight,
      backgroundColor: blueDark,
      highlightColor: red,
      splashColor: green,
    ),
  );
}