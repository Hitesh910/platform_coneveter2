import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/home/view/home_screen_android.dart';
import 'package:platform_coneveter/screen/home/view/home_screen_ios.dart';
import 'package:platform_coneveter/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => SplashScreen(),
  "/home":(context) => HomeScreenAndroid(),
};

Map<String,WidgetBuilder> app_routes1 = {
  "/":(context) => SplashScreen(),
  "/home":(context) => HomeScreenIos(),
};