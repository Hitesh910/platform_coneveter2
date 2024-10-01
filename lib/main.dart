import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/home/provider/home_provider.dart';
import 'package:platform_coneveter/screen/setting/provider/seeting_provider.dart';
import 'package:platform_coneveter/utils/app_routes.dart';
import 'package:platform_coneveter/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HomeProvider()),
          ChangeNotifierProvider.value(value: SettingProvider()),
        ],
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            value.getTheme();
            return value.isIos == false
                ? MaterialApp(
              debugShowCheckedModeBanner: false,
                    theme: ThemeData.light(),
                    darkTheme: ThemeData.dark(),
                    themeMode:
                    // ThemeMode.dark,
                    value.theme == true
              ?ThemeMode.dark
                    :ThemeMode.light,
                    routes: app_routes,
                  )
                : CupertinoApp(
              debugShowCheckedModeBanner: false,
                    theme: value.theme == true
              ?dark1 :light1,
                    routes: app_routes1,
                  );
          },
        )
        //       ?MaterialApp(
        //     routes: app_routes,
        //   )
        // ),
        // :CupertinoApp(
        //   routes: app_routes1,
        // )
        ),
  );
}
