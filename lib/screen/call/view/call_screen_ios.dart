import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/provider/home_provider.dart';

class CallScreenIos extends StatefulWidget {
  const CallScreenIos({super.key});

  @override
  State<CallScreenIos> createState() => _CallScreenIosState();
}

class _CallScreenIosState extends State<CallScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

    return CupertinoPageScaffold(
      child: ListView.builder(
        itemCount: providerW!.contactList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CupertinoListTile(
                leading: const CircleAvatar(),
                title: Text(
                  "${providerR!.contactList[index].name}",
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "${providerR!.contactList[index].message}",
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: CupertinoButton(
                  onPressed: () async {
                    await launch(
                        "tel: +91${providerR!.contactList[index].mobile}");
                    // await Uri numberUri =
                    // if(await launchUrl())
                  },
                  child: const Icon(CupertinoIcons.phone),
                ),
                onTap: () {
                  // showDialog();
                  providerR!.updateIndex(index);
                },
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
