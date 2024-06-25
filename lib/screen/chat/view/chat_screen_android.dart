import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_coneveter/screen/contact/model/contact_model.dart';
import 'package:platform_coneveter/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ChatScreenAndroid extends StatefulWidget {
  const ChatScreenAndroid({super.key});

  @override
  State<ChatScreenAndroid> createState() => _ChatScreenAndroidState();
}

class _ChatScreenAndroidState extends State<ChatScreenAndroid> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtMsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();

    providerW = context.watch<HomeProvider>();
    return Scaffold(
      body: ListView.builder(
        itemCount: providerW!.contactList.length,
        itemBuilder: (context, index) {
          return
              // Text("${providerR!.contactList[index].name}");
              Column(
            children: [
              ListTile(
                leading: providerR!.contactList[providerR!.selectedIndex].image == null
                    ? CircleAvatar(
                        radius: 30,
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            FileImage(File("${providerR!.contactList[index].image}")),
                      ),
                title: Text("${providerR!.contactList[index].name}"),
                subtitle: Text("${providerR!.contactList[index].message}"),
                trailing: Text("Date"),
                onTap: () {
                  showDilaog();
                  print("${providerR!.contactList[index].message}");
                  providerR!.updateIndex(index);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void showDilaog() {
    txtMsg.text = providerR!.contactList[providerR!.selectedIndex].message!;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(File(
                      "${providerR!.contactList[providerR!.selectedIndex].image}")),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${providerR!.contactList[providerR!.selectedIndex].name}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                    "${providerR!.contactList[providerR!.selectedIndex].message}"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Column(
                          //   children: [
                          showDialog(
                            context: context,
                            builder: (context) {
                              return
                                  // Text("Heello");
                                  AlertDialog(
                                content:
                                    // Text("Hello"),
                                    Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: txtMsg,
                                      decoration: const InputDecoration(
                                          label: Text("Update Message")),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Update message is required";
                                        }
                                        return null;
                                      },
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          ContactModel c1 = ContactModel(
                                              message: txtMsg.text,image: providerR!.contactList[providerR!.selectedIndex].image,mobile: providerR!.contactList[providerR!.selectedIndex].mobile,name: providerR!.contactList[providerR!.selectedIndex].name);
                                          providerR!.updateData(c1);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          // providerR!.updateData(c1);
                                        },
                                        child: Text("Save"))
                                  ],
                                ),
                              );
                            },
                          );
                          // AlertDialog(
                          //   content: Text("Hello"),
                          //   // TextFormField(
                          //   //   controller: txtMsg,
                          //   //   decoration:
                          //   //   const InputDecoration(label: Text("Update Message")),
                          //   //   validator: (value) {
                          //   //     if (value!.isEmpty) {
                          //   //       return "Update message is required";
                          //   //     }
                          //   //     return null;
                          //   //   },
                          //   // ),
                          // ),
                          // ),
                          //     ElevatedButton(onPressed: () {
                          //       ContactModel c1 = ContactModel(message: txtMsg.text);
                          //       providerR!.updateData(c1);
                          //     }, child: Text("Save"))
                          //   ],
                          // );
                        }),
                    IconButton(
                        onPressed: () {
                          providerW!.deleteData();
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
                FilledButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                // TextButton(onPressed: onPressed, child: child)
              ],
            );
          },
        );
      },
    );
  }
}
