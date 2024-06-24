import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: Colors.amber)
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark);

CupertinoThemeData light1 =  CupertinoThemeData(
  brightness: Brightness.light
);

CupertinoThemeData dark1 = CupertinoThemeData(
  brightness: Brightness.dark,
      scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
  textTheme: CupertinoTextThemeData(textStyle: TextStyle(color: CupertinoColors.white,fontSize: 18),pickerTextStyle: TextStyle(color: CupertinoColors.black),
  dateTimePickerTextStyle: TextStyle(color: CupertinoColors.black,fontSize: 20))
);