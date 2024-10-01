import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
import '../provider/seeting_provider.dart';

class SettingScreenIos extends StatefulWidget {
  const SettingScreenIos({super.key});

  @override
  State<SettingScreenIos> createState() => _SettingScreenIosState();
}

class _SettingScreenIosState extends State<SettingScreenIos> {
  HomeProvider? providerHomeR;
  HomeProvider? providerHomeW;
  SettingProvider? providerR;
  SettingProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  GlobalKey<FormState> firmKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<SettingProvider>()
      ..getData()
      ..getBio().then(
        (value) {
          txtName.text = context.read<SettingProvider>().name!;
          txtBio.text = context.read<SettingProvider>().bio!;
        },
      )
      ..getImage();
  }

  @override
  Widget build(BuildContext context) {
    providerHomeR = context.read<HomeProvider>();
    providerHomeW = context.watch<HomeProvider>();
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();

    return CupertinoPageScaffold(
      // backgroundColor:  providerHomeW!.theme == "Light" ? CupertinoColors.white.withOpacity(0.8) : CupertinoColors.black,
      child: Form(
        key: firmKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Setting",style: TextStyle(fontSize: 22),),
            ),
            CupertinoListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text("Profile"),
              trailing: providerW!.isProfile
                  ? const Icon(CupertinoIcons.down_arrow)
                  : const Icon(CupertinoIcons.arrow_right),
              onTap: () {
                providerR!.profile();
              },
            ),
            // SizedBox(height: 15,),
            Visibility(
              visible: providerW!.isProfile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: const Alignment(1.4, 1),
                    children: [
                      providerR!.selectedImage == null
                          ? Center(child: const CircleAvatar(radius: 50))
                          : Center(
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  File("${providerW!.selectedImage}"),
                                ),
                              ),
                          ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: CupertinoButton(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? xfile = await picker.pickImage(
                            source: ImageSource.gallery);
                        providerR!.selectImage(xfile?.path);
                      },
                      color: CupertinoColors.activeBlue,
                      child: const Icon(CupertinoIcons.camera),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Name :"),
                  ),
                  CupertinoTextFormFieldRow(
                    controller: txtName,
                    placeholder: "Enter Name",
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.black),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Bio :"),
                  ),
                  CupertinoTextFormFieldRow(
                    controller: txtBio,
                    placeholder: "Enter Bio",
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.black),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bio is required";
                      }
                      return null;
                    },
                  ),
                  Center(
                    child: CupertinoButton(
                      onPressed: () {
                        if (firmKey.currentState!.validate()) {
                          providerR!.setImage(providerW!.selectedImage!);
                          providerR!.saveData(txtName.text);
                          providerR!.saveBio(txtBio.text);
                        }
                      },
                      child: const Text("Save"),
                    ),
                  )
                ],
              ),
            ),
            CupertinoListTile(
              leading: const Icon(CupertinoIcons.color_filter),
              title: const Text("Profile"),
              trailing: CupertinoSwitch(value: providerHomeW!.theme!, onChanged: (value) {
                providerHomeW!.saveTheme(value);
              },)
            ),
          ],
        ),
      ),
    );
  }
}
