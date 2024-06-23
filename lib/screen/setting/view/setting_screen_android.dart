import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_coneveter/screen/home/provider/home_provider.dart';
import 'package:platform_coneveter/screen/setting/model/setting_model.dart';
import 'package:provider/provider.dart';

import '../provider/seeting_provider.dart';

class SettingScreenAndroid extends StatefulWidget {
  const SettingScreenAndroid({super.key});

  @override
  State<SettingScreenAndroid> createState() => _SettingScreenAndroidState();
}

class _SettingScreenAndroidState extends State<SettingScreenAndroid> {
  SettingProvider? providerR;
  SettingProvider? providerW;
  HomeProvider? providerHomeR;
  HomeProvider? providerHomeW;
  GlobalKey<FormState> firmKey = GlobalKey();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SettingProvider>().getData();
    context.read<SettingProvider>().getBio();
    print(context.read<SettingProvider>().name);
    print(context.read<SettingProvider>().bio);
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    providerHomeR = context.read<HomeProvider>();
    providerHomeW = context.watch<HomeProvider>();
    txtName.text = providerR!.name!;
    txtBio.text = providerR!.bio!;
    return Form(
      key: firmKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: Form(
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  trailing: providerW!.isProfile
                      ? Icon(Icons.arrow_drop_down_outlined)
                      : Icon(Icons.arrow_right),
                  onTap: () {
                    providerR!.profile();
                  },
                ),
                Visibility(
                    visible: providerW!.isProfile,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment(1.4, 1),
                          children: [
                            providerR!.selectedImage == null
                                ? CircleAvatar(radius: 50)
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(
                                        File("${providerW!.selectedImage}")),
                                  ),
                            IconButton.filledTonal(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? xfile = await picker.pickImage(
                                    source: ImageSource.gallery);
                                providerR!.selectImage(xfile?.path);
                              },
                              icon: Icon(Icons.camera_alt),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.blue)),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                          width: 380,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Enter your name")),
                            controller: txtName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                "Name is required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                          width: 380,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Enter Bio")),
                            controller: txtBio,
                            validator: (value) {
                              if (value!.isEmpty) {
                                "Name is required";
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              // providerR!.getBio();
                              // providerR!.getData();
                              if (firmKey.currentState!.validate()) {
                                // SettingModel s1 =
                                // SettingModel(name: txtName.text,bio: txtBio.text);
                                providerR!.saveData(txtName.text);
                                providerR!.saveBio(txtBio.text);
                              }
                            },
                            child: Text("Save"))
                      ],
                    )),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: const Text("System"),
                          onTap: () {
                            providerHomeR!.saveTheme('System');
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("Light"),
                          onTap: () {
                            providerHomeR!.saveTheme('Light');
                          },
                        ),
                        PopupMenuItem(
                          child: const Text("Dark"),
                          onTap: () {
                            providerHomeR!.saveTheme('Dark');
                            print("${providerHomeR!.theme}");
                          },
                        ),
                      ];
                    },
                  ),
                ),
                // Visibility(child: PopupMenuButton(
                //   itemBuilder: (context) {
                //     return [
                //       PopupMenuItem(
                //         child: const Text("System"),
                //         onTap: () {
                //           providerHomeR!.saveTheme('System');
                //         },
                //       ),
                //       PopupMenuItem(
                //         child: const Text("Light"),
                //         onTap: () {
                //           providerHomeR!.saveTheme('Light');
                //         },
                //       ),
                //       PopupMenuItem(
                //         child: const Text("Dark"),
                //         onTap: () {
                //           providerHomeR!.saveTheme('Dark');
                //         },
                //       ),
                //     ];
                //   },
                // ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
