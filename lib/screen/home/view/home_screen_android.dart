import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/call/view/call_screen_android.dart';
import 'package:platform_coneveter/screen/chat/view/chat_screen_android.dart';
import 'package:platform_coneveter/screen/contact/view/contact_screen_android.dart';
import 'package:platform_coneveter/screen/setting/view/setting_screen_android.dart';

class HomeScreenAndroid extends StatefulWidget {
  const HomeScreenAndroid({super.key});

  @override
  State<HomeScreenAndroid> createState() => _HomeScreenAndroidState();
}

class _HomeScreenAndroidState extends State<HomeScreenAndroid> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Platform"),
          bottom: TabBar(
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
        body: TabBarView(children: [
          ContactScreenAndroid(),
          ChatScreenAndroid(),
          CallScreenAndroid(),
          SettingScreenAndroid(),

        ]),
      ),
    );
  }
}
