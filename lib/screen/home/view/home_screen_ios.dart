import 'package:flutter/cupertino.dart';
import 'package:platform_coneveter/screen/call/view/call_screen_ios.dart';
import 'package:platform_coneveter/screen/chat/view/chat_screen_ios.dart';
import 'package:platform_coneveter/screen/contact/view/contact_screen_ios.dart';
import 'package:platform_coneveter/screen/setting/view/setting_screen_ios.dart';
import 'package:platform_coneveter/utils/permission_handle.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
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
    providerW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            "Platform",
          ),
          trailing: CupertinoSwitch(
            value: providerW!.isIos,
            onChanged: (value) {
              providerR!.isCheck();
            },
          ),
        ),
        child: CupertinoTabScaffold(
          // controller: CupertinoTabController(initialIndex: 4),
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_badge_plus)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.circle_grid_hex_fill)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
          ]),
          tabBuilder: (context, index) {
            return index == 0
                ? const ContactScreenIos()
                : index == 1
                    ? const ChatScreenIos()
                    : const SettingScreenIos();
            // ? index == 2
            //             ? CallScreenIos()
            //             : SettingScreenIos()
          },
        ));
  }
}
