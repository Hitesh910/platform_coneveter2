import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ChatScreenIos extends StatefulWidget {
  const ChatScreenIos({super.key});

  @override
  State<ChatScreenIos> createState() => _ChatScreenIosState();
}

class _ChatScreenIosState extends State<ChatScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          ListView.builder(
            itemCount: providerW!.contactList.length,
            itemBuilder: (context, index) {
              return CupertinoListTile(
                leading: SizedBox(
                  height: 500,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            File("${providerR!.contactList[index].image}"),
                          ),
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
                title: Text(
                  "${providerR!.contactList[index].name}",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "${providerR!.contactList[index].message}",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Text(
                    "${providerR!.d1.day}/${providerR!.d1.month}/${providerR!.d1.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
                onTap: () {},
              );
            },
          ),
        ],
        //  SliverList.builder(
        //   itemCount: providerW!.contactList.length,
        //   itemBuilder: (context, index) {
        //     return CupertinoListTile(
        //       leading: SizedBox(
        //         height: 500,
        //         child: Container(
        //           height: 200,
        //           width: 200,
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                 image: FileImage(
        //                   File("${providerR!.contactList[index].image}"),
        //                 ),
        //               ),
        //               shape: BoxShape.circle),
        //         ),
        //       ),
        //       title: Text(
        //         "${providerR!.contactList[index].name}",
        //         style: TextStyle(fontSize: 20),
        //       ),
        //       subtitle: Text(
        //         "${providerR!.contactList[index].message}",
        //         style: TextStyle(fontSize: 15),
        //       ),
        //       trailing: Text(
        //           "${providerR!.d1.day}/${providerR!.d1.month}/${providerR!.d1.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
        //       onTap: () {},
        //     );
        //   },
        // ),
      ),
    );
  }
}
