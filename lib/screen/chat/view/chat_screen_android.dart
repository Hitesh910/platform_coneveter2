import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/home/provider/home_provider.dart';
class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({super.key});

  @override
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {
  HomeProvider providerR = HomeProvider();
  HomeProvider providerW = HomeProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerW.contactList.length,
              itemBuilder: (context, index) {
                return Consumer(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                "${context.read<HomeProvider>().contactList[index].name}"),
                            Text("hl"),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),,
    )
  }
}
