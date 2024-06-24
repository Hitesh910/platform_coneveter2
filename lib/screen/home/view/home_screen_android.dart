import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/call/view/call_screen_android.dart';
import 'package:platform_coneveter/screen/chat/view/chat_screen_android.dart';
import 'package:platform_coneveter/screen/contact/view/contact_screen_android.dart';
import 'package:platform_coneveter/screen/setting/view/setting_screen_android.dart';
import 'package:platform_coneveter/utils/permission_handle.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreenAndroid extends StatefulWidget {
  const HomeScreenAndroid({super.key});

  @override
  State<HomeScreenAndroid> createState() => _HomeScreenAndroidState();
}

class _HomeScreenAndroidState extends State<HomeScreenAndroid> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PermissionHandle();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.read<HomeProvider>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade300,
          actions: [
            Switch(value: providerW!.isIos, onChanged: (value) {
              providerR!.isCheck();
            },)
          ],
          title: const Text("Platform"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Contact",
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Call",
              ),
              Tab(
                text: "Setting",
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          ContactScreenAndroid(),
          ChatScreenAndroid(),
          CallScreenAndroid(),
          SettingScreenAndroid(),

        ]),
      ),
    );
  }
}
