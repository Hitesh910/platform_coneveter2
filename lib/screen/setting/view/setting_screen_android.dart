import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  SettingProvider providerR = SettingProvider();
  SettingProvider providerW = SettingProvider();
  GlobalKey<FormState> firmKey = GlobalKey();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    return Scaffold(
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
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
providerR.profile(true);
                },
              ),
              Visibility(
                visible: providerW.isProfile,
                  child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Enter your name")),
                    controller: txtName,
                    validator: (value) {
                      if(value!.isEmpty!)
                        {
                          "Name is required";
                        }
                     return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Enter Bio")),
                    controller: txtName,
                    validator: (value) {
                      if(value!.isEmpty!)
                        {
                          "Name is required";
                        }
                     return null;
                    },
                  ),
                  ElevatedButton(onPressed: () {
                    providerR.getBio();
                    providerR.getData();
                    if(firmKey.currentState!.validate())
                      {
                        SettingModel s1 =
                        SettingModel(name: txtName.text,bio: txtBio.text);
                      }
                  }, child: Text("Save"))

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
                          providerR.saveTheme('System');
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Light"),
                        onTap: () {
                          providerR.saveTheme('Light');
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Dark"),
                        onTap: () {
                          providerR.saveTheme('Dark');
                        },
                      ),
                    ];
                  },
                ),
              ),
              Visibility(child: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("System"),
                      onTap: () {
                        providerR.saveTheme('System');
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Light"),
                      onTap: () {
                        providerR.saveTheme('Light');
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Dark"),
                      onTap: () {
                        providerR.saveTheme('Dark');
                      },
                    ),
                  ];
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
