import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/provider/home_provider.dart';

class CallScreenAndroid extends StatefulWidget {
  const CallScreenAndroid({super.key});

  @override
  State<CallScreenAndroid> createState() => _CallScreenAndroidState();
}

class _CallScreenAndroidState extends State<CallScreenAndroid> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: providerW!.theme == false
          ?
      Colors.white54
          : Colors.black12,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.contactList.length,
              itemBuilder: (context, index) {
              return  Column(
                children: [
                  ListTile(
                      title: Text("${providerR!.contactList[index].name}"),
                      subtitle: Text("${providerR!.contactList[index].mobile}"),
                    trailing: IconButton(onPressed: () async {
                      await launch("tel: +91${providerR!.contactList[index].mobile}");
                      // await Uri numberUri =
                      // if(await launchUrl())

                    }, icon: Icon(Icons.add_call)),
                    ),
                ],
              );
              },
            ),
          )
        ],
      ),
    );
  }
}
