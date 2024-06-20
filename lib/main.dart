import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/home/provider/home_provider.dart';
import 'package:platform_coneveter/screen/setting/provider/seeting_provider.dart';
import 'package:platform_coneveter/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeProvider()),
        ChangeNotifierProvider.value(value: SettingProvider()),
      ],
      child: MaterialApp(
        routes: app_routes,
      ),
    ),
    // CupertinoApp(
    //   routes: app_routes1,
    // )
  );
}