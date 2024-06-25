import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/contact/model/contact_model.dart';
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
  TextEditingController txtMsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Padding(
      padding: const EdgeInsets.all(6),
      child: CupertinoPageScaffold(
        // backgroundColor: CupertinoColors.systemTeal
        //     .withGreen(250)
        //     .withRed(242)
        //     .withBlue(255),
        child: ListView.builder(
          itemCount: providerW!.contactList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CupertinoListTile(
                  leading: CircleAvatar( ),
                  title: Text(
                    "${providerR!.contactList[index].name}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "${providerR!.contactList[index].message}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                      "${providerR!.d1!.day}/${providerR!.d1!.month}/${providerR!.d1!.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
                  onTap: () {
                    showDialog();
                    providerR!.updateIndex(index);
                  },
                ),
                const Divider()
              ],
            );
          },
        ),
        // CustomScrollView(
        //   slivers: [
        //     // ListView.builder(
        //     //   itemCount: providerW!.contactList.length,
        //     //   itemBuilder: (context, index) {
        //     //     return CupertinoListTile(
        //     //       leading: SizedBox(
        //     //         height: 500,
        //     //         child: Container(
        //     //           height: 200,
        //     //           width: 200,
        //     //           decoration: BoxDecoration(
        //     //               image: DecorationImage(
        //     //                 image: FileImage(
        //     //                   File("${providerR!.contactList[index].image}"),
        //     //                 ),
        //     //               ),
        //     //               shape: BoxShape.circle),
        //     //         ),
        //     //       ),
        //     //       title: Text(
        //     //         "${providerR!.contactList[index].name}",
        //     //         style: TextStyle(fontSize: 20),
        //     //       ),
        //     //       subtitle: Text(
        //     //         "${providerR!.contactList[index].message}",
        //     //         style: TextStyle(fontSize: 15),
        //     //       ),
        //     //       trailing: Text(
        //     //           "${providerR!.d1!.day}/${providerR!.d1!.month}/${providerR!.d1!.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
        //     //       onTap: () {},
        //     //     );
        //     //   },
        //     // ),
        //      SliverList.builder(
        //       itemCount: providerW!.contactList.length,
        //       itemBuilder: (context, index) {
        //         return CupertinoListTile(
        //           leading: SizedBox(
        //             height: 500,
        //             child: Container(
        //               height: 200,
        //               width: 200,
        //               decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                     image: FileImage(
        //                       File("${providerR!.contactList[index].image}"),
        //                     ),
        //                   ),
        //                   shape: BoxShape.circle),
        //             ),
        //           ),
        //           title: Text(
        //             "${providerR!.contactList[index].name}",
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           subtitle: Text(
        //             "${providerR!.contactList[index].message}",
        //             style: TextStyle(fontSize: 15),
        //           ),
        //           trailing: Text(
        //               "${providerR!.d1!.day}/${providerR!.d1!.month}/${providerR!.d1!.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
        //           onTap: () {},
        //         );
        //       },
        //     ),
        //   ],
        // //  SliverList.builder(
        // //   itemCount: providerW!.contactList.length,
        // //   itemBuilder: (context, index) {
        // //     return CupertinoListTile(
        // //       leading: SizedBox(
        // //         height: 500,
        // //         child: Container(
        // //           height: 200,
        // //           width: 200,
        // //           decoration: BoxDecoration(
        // //               image: DecorationImage(
        // //                 image: FileImage(
        // //                   File("${providerR!.contactList[index].image}"),
        // //                 ),
        // //               ),
        // //               shape: BoxShape.circle),
        // //         ),
        // //       ),
        // //       title: Text(
        // //         "${providerR!.contactList[index].name}",
        // //         style: TextStyle(fontSize: 20),
        // //       ),
        // //       subtitle: Text(
        // //         "${providerR!.contactList[index].message}",
        // //         style: TextStyle(fontSize: 15),
        // //       ),
        // //       trailing: Text(
        // //           "${providerR!.d1.day}/${providerR!.d1.month}/${providerR!.d1.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
        // //       onTap: () {},
        // //     );
        // //   },
        // // ),
        // ),
        // ListView.builder(
        //   itemCount: providerW!.contactList.length,
        //   itemBuilder: (context, index) {
        //     return Column(
        //       children: [
        //         CupertinoListTile(
        //           leading: SizedBox(
        //             height: 500,
        //             child: Container(
        //               height: 200,
        //               width: 200,
        //               decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                     image: FileImage(
        //                       File("${providerR!.contactList[index].image}"),
        //                     ),
        //                   ),
        //                   shape: BoxShape.circle),
        //             ),
        //           ),
        //           title: Text(
        //             "${providerR!.contactList[index].name}",
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           subtitle: Text(
        //             "${providerR!.contactList[index].message}",
        //             style: TextStyle(fontSize: 15),
        //           ),
        //           trailing: Text(
        //               "${providerR!.d1!.day}/${providerR!.d1!.month}/${providerR!.d1!.year}  ${providerR!.t1!.hour}:${providerR!.t1!.minute}"),
        //           onTap: () {
        //             showDialog();
        //             providerR!.updateIndex(index);
        //           },
        //         ),
        //         Divider()
        //       ],
        //     );
        //   },
        // ),
        // CustomScrollView(
        //   slivers: [
        //     ListView.builder(
        //       itemCount: providerW!.contactList.length,
        //       itemBuilder: (context, index) {
        //         return CupertinoListTile(
        //           leading: SizedBox(
        //             height: 500,
        //             child: Container(
        //               height: 200,
        //               width: 200,
        //               decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                     image: FileImage(
        //                       File("${providerR!.contactList[index].image}"),
        //                     ),
        //                   ),
        //                   shape: BoxShape.circle),
        //             ),
        //           ),
        //           title: Text(
        //             "${providerR!.contactList[index].name}",
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           subtitle: Text(
        //             "${providerR!.contactList[index].message}",
        //             style: TextStyle(fontSize: 15),
        //           ),
        //           trailing: Text(
        //               "${providerR!.d1.day}/${providerR!.d1.month}/${providerR!.d1.year}  ${providerR!.t1.hour}:${providerR!.t1.minute}"),
        //           onTap: () {},
        //         );
        //       },
        //     ),
        //   ],
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
        // ),
      ),
    );
  }

  void showDialog() {
    txtMsg.text = providerR!.contactList[providerR!.selectedIndex].message!;
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          color: CupertinoColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: FileImage(File(
                            "${providerW!.contactList[providerR!.selectedIndex].image}")))),
              ),
              Text(
                "${providerR!.contactList[providerR!.selectedIndex].name}",
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.pen),
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: const Text("Update Message"),
                              content: Column(
                                children: [
                                  CupertinoTextFormFieldRow(
                                    controller: txtMsg,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: CupertinoColors.black),
                                    ),
                                    placeholder: "Enter Message",
                                  ),
                                  CupertinoButton(child: const Text("Save"), onPressed: () {
                                    ContactModel c1 = ContactModel(message: txtMsg.text,name: providerR!.contactList[providerR!.selectedIndex].name,mobile: providerR!.contactList[providerR!.selectedIndex].mobile,image: providerR!.contactList[providerR!.selectedIndex].image);
                                    providerR!.updateData(c1);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },)
                                ],
                              ),
                            );
                          });
                    },
                  ),
                  CupertinoButton(child: Icon(CupertinoIcons.delete), onPressed: () {
                    providerW!.deleteData();
                    Navigator.pop(context);
                  },)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton.filled(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
