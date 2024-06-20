import 'package:flutter/material.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();
  HomeProvider providerR = HomeProvider();
  HomeProvider providerW = HomeProvider();


  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.read<HomeProvider>();
    return Scaffold(body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment(1.4,1),
              children: [
                CircleAvatar(radius: 50,),
                IconButton.filledTonal(onPressed: () {

                }, icon: Icon(Icons.camera_alt),style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),)
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 380,
              child: TextFormField(
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
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              width: 380,
              child: TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Enter your name")),
                controller: txtMobile,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    "MObile is required";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 50,
              width: 380,
              child: TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Enter your name")),
                controller: txtMessage,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    "Message is required";
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(onPressed: () {
              if(formKey.currentState!.validate())
              {
                ContactModel c1 = ContactModel(name: txtName.text,message: txtMessage.text,mobile: txtMobile.text);
                providerR.addContact(c1);
              }
            }, child: Text("Save"))
          ],
        ),
      ),
    ),);
  }
}
