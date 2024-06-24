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

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Stack(
            alignment: Alignment(0.3, 1),
            children: [
              //     Transform.scale(
              //       alignment: Alignment(0,2.5),
              //       scale: 1.5,
              //       child: Container(
              //         height: 500,
              //         width: 800,
              //         // color: CupertinoColors.inactiveGray,
              //         decoration: BoxDecoration(
              //           // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120),bottomRight: Radius.circular(120)),
              //             color: CupertinoColors.opaqueSeparator,shape: BoxShape.circle),
              //       ),
              //     ),
              Center(
                child: providerR!.selectedImage == null
                    ? Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CupertinoColors.inactiveGray),
                      )
                    :
                    // Container(
                    //   height: 150,
                    //   width: 150,
                    //   decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: FileImage(File("${providerW!.selectedImage}")))),
                    // )
                    ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(
                          File("${providerW!.selectedImage}"),
                          width: 150,
                          height: 150,
                        ),
                      ),
              ),
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: CupertinoButton(
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    xFile = await picker.pickImage(source: ImageSource.gallery);
                    providerR!.selectImage(xFile!.path);
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                color: CupertinoColors.opaqueSeparator.withOpacity(0.2)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.person),
                    SizedBox(
                      width: 320,
                      child: CupertinoTextFormFieldRow(
                        controller: txtName,
                        placeholder: "Enter Name",
                        decoration: BoxDecoration(
                            border: Border.all(color: CupertinoColors.black)),
                      ),
                    ),
                    // Icon(CupertinoIcons.person)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.phone_fill),
                    SizedBox(
                      width: 320,
                      child: CupertinoTextFormFieldRow(
                        controller: txtMobile,
                        placeholder: "Enter Mobile Number",
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.chat_bubble_text),
                    SizedBox(
                      width: 320,
                      child: CupertinoTextFormFieldRow(
                        controller: txtMessage,
                        placeholder: "Enter Message",
                        // prefix: Icon(CupertinoIcons.alarm),
                        decoration: BoxDecoration(
                            border: Border.all(color: CupertinoColors.black)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CupertinoColors.opaqueSeparator.withOpacity(0.2),
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
                      Icon(CupertinoIcons.calendar),
                      SizedBox(
                        width: 40,
                      ),
                      date == null
                          ? Text("Clicke Date")
                          : Text(
                              "${providerW!.d1.day}/${providerW!.d1.month}/${providerW!.d1.year}")
                    ],
                  ),
                ),
                Divider(),
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
                      Icon(CupertinoIcons.time),
                      SizedBox(
                        width: 40,
                      ),
                      time == null
                          ? Text("Click Time")
                          : Text(
                              "${providerW!.t1.hour}:${providerW!.t1.minute}")
                    ],
                  ),
                ),
                // CupertinoButton(child: Text("Save"), onPressed: () {
                //   ContactModel c1 = ContactModel(image: xFile!.path,name: txtName.text,mobile: txtMobile.text,message: txtMessage.text);
                // },)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoButton.filled(
            child: Text("Save"),
            onPressed: () {
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
            },
          )
        ],
      ),
    ));
  }
}
