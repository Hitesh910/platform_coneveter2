import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_coneveter/screen/contact/model/contact_model.dart';
import 'package:platform_coneveter/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ContactScreenAndroid extends StatefulWidget {
  const ContactScreenAndroid({super.key});

  @override
  State<ContactScreenAndroid> createState() => _ContactScreenAndroidState();
}

class _ContactScreenAndroidState extends State<ContactScreenAndroid> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtMessage = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  HomeProvider? providerR;
  HomeProvider? providerW;
  XFile? xfile;
  DateTime? d1;
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor:
          providerW!.theme == false ? Colors.white54 : Colors.black12,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: const Alignment(1.4, 1),
                  children: [
                    providerR!.selectedImage == null
                        ? const CircleAvatar(
                            radius: 50,
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(
                              File("${providerW!.selectedImage}"),
                            ),
                          ),
                    IconButton.filledTonal(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();
                        xfile =
                            await picker.pickImage(source: ImageSource.gallery);
                        providerR!.selectImage(xfile?.path);
                      },
                      icon: const Icon(Icons.camera_alt),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: 380,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter your name"),
                  ),
                  controller: txtName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 380,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter your Mobile"),
                  ),
                  controller: txtMobile,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mobile is required";
                    } else if (value.length != 10) {
                      return "Enter valid number";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 380,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter your Message"),
                  ),
                  controller: txtMessage,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Message is required";
                    }
                    return null;
                  },
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  d1 = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2030),
                  );
                  providerW!.Date(d1!);
                },
                label: d1 == null
                    ? const Text("Pick date")
                    : Text(
                        "${providerR?.d1!.day}/${providerR?.d1!.month}/${providerR?.d1!.year}"),
                icon: const Icon(Icons.calendar_month),
              ),
              TextButton.icon(
                onPressed: () async {
                  time = await showTimePicker(
                      context: context, initialTime: providerR!.t1);
                  providerW!.Time(time!);
                },
                label: time == null
                    ? const Text("Pick Time")
                    : Text("${providerR!.t1.hour}:${providerR!.t1.minute}"),
                icon: const Icon(Icons.watch_later),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ContactModel c1 = ContactModel(
                          name: txtName.text,
                          message: txtMessage.text,
                          mobile: txtMobile.text,
                          image: xfile?.path);
                      providerR!.addContact(c1);
                      txtName.clear();
                      txtMobile.clear();
                      txtMessage.clear();
                      providerR!.selectImage(null);
                      // providerR!.changeImage();
                      // providerW!.Time(null as TimeOfDay);
                      time = null;
                      d1 = null;
                    }
                  },
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
