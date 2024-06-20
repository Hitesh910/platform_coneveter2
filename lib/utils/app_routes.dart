import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/home/view/home_screen_android.dart';
import 'package:platform_coneveter/screen/home/view/home_screen_ios.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreenAndroid(),
};

Map<String,WidgetBuilder> app_routes1 = {
  "/":(context) => HomeScreenIos()
};