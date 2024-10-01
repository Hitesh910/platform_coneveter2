import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_coneveter/screen/contact/model/contact_model.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ContactScreenIos extends StatefulWidget {
  const ContactScreenIos({super.key});

  @override
  State<ContactScreenIos> createState() => _ContactScreenIosState();
}

class _ContactScreenIosState extends State<ContactScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TimeOfDay? time;
  DateTime? date;
  XFile? xFile;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtMessage = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: CupertinoPageScaffold(
            child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Stack(
                alignment: const Alignment(0.3, 1),
                children: [
                  Center(
                    child: providerR!.selectedImage == null
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CupertinoColors.inactiveGray),
                          )
                        : ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: Image.file(
                              File("${providerW!.selectedImage}"),
                              width: 150,
                              height: 150,
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () async {

                      ImagePicker picker = ImagePicker();
                      xFile = await picker.pickImage(source: ImageSource.gallery);
                      providerR!.selectImage(xFile!.path);

                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                      child:const Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: CupertinoColors.opaqueSeparator.withOpacity(0.2)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 10,),
                        const Icon(CupertinoIcons.person),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CupertinoTextFormFieldRow(
                            controller: txtName,
                            placeholder: "Enter Name",
                            decoration: BoxDecoration(
                                border: Border.all(color: CupertinoColors.black)),
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Name is required";
                                }
                              return null;
                            },
                          ),
                        ),
                        // Icon(CupertinoIcons.person)
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 10,),
                        const Icon(CupertinoIcons.phone_fill),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CupertinoTextFormFieldRow(
                            controller: txtMobile,
                            placeholder: "Enter Mobile Number",
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Mobile number is required";
                                }
                              else if(value.length != 10)
                                {
                                  return "Enter valid number";
                                }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:  10,),
                        const Icon(CupertinoIcons.chat_bubble_text),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CupertinoTextFormFieldRow(
                            controller: txtMessage,
                            placeholder: "Enter Message",
                            // prefix: Icon(CupertinoIcons.alarm),
                            decoration: BoxDecoration(
                                border: Border.all(color: CupertinoColors.black)),
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Message is required";
                                }
                              return null;
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: CupertinoColors.opaqueSeparator.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              color: CupertinoColors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (date) {
                                  providerR!.Date(date);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.calendar),
                          const SizedBox(
                            width: 20,
                          ),
                          providerW!.d1 == null
                              ? const Text("Click Date")
                              : Text(
                                  "${providerW!.d1!.day}/${providerW!.d1!.month}/${providerW!.d1!.year}")
                        ],
                      ),
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              color: CupertinoColors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (value) {
                                  time = TimeOfDay(
                                      hour: value.hour, minute: value.minute);
                                  providerR!.Time(time!);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.time),
                          const SizedBox(
                            width: 20,
                          ),
                        time == null
                              ? const Text("Click Time")
                              : Text(
                                  "${providerW!.t1.hour}:${providerW!.t1.minute}")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton.filled(
                child: const Text("Save"),
                onPressed: () {
                  if(formKey.currentState!.validate())
                    {
                      ContactModel c1 = ContactModel(
                          image: xFile!.path,
                          name: txtName.text,
                          mobile: txtMobile.text,
                          message: txtMessage.text);
                      providerR!.addContact(c1);
                      txtName.clear();
                      txtMessage.clear();
                      txtMobile.clear();
                      providerR!.selectImage(null);
                      time = null;
                      date = null;
                    }
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
