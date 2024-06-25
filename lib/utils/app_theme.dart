import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(color: Colors.amber),
  scaffoldBackgroundColor: Colors.cyan.withGreen(250).withRed(242).withBlue(280),
);

ThemeData dark = ThemeData(brightness: Brightness.dark);

CupertinoThemeData light1 = CupertinoThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor:
      CupertinoColors.systemTeal.withGreen(250).withRed(242).withBlue(255),
);

CupertinoThemeData dark1 = const CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(color: CupertinoColors.white, fontSize: 18),
        pickerTextStyle: TextStyle(color: CupertinoColors.black),
        dateTimePickerTextStyle:
            TextStyle(color: CupertinoColors.black, fontSize: 20)));
