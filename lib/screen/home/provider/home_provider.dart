import 'package:flutter/material.dart';
import 'package:platform_coneveter/utils/helper/shared_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../contact/model/contact_model.dart';

class HomeProvider with ChangeNotifier
{
  SharedHelper share = SharedHelper();
  List<ContactModel> contactList = [];
  bool isProfile = false;
  String? selectedImage;
  bool isIos= false;
  int selectedIndex = 0;
  bool? theme = false;
 DateTime? d1;
 TimeOfDay t1 = TimeOfDay.now();

  void  profile(bool value)
  {
    value =!value;
    notifyListeners();
  }

  void addContact(ContactModel c1)
  {
    contactList.add(c1);
    print(contactList);
    notifyListeners();
  }

  void selectImage(String? image)
  {
    selectedImage = image;
    notifyListeners();
  }

  void isCheck()
  {
    isIos = !isIos;
    notifyListeners();
  }

  void updateIndex(int value)
  {
    selectedIndex = value;
    notifyListeners();
  }

  void saveTheme(bool theme) {
    share.setData(theme);
    getTheme();
  }

  void getTheme()async{
    theme = await share.getData();
    notifyListeners();
  }

  Future<void> Date(DateTime date)
  async {
    d1 =date;
    notifyListeners();
  }

  void Time(TimeOfDay time)
  {
    t1 = time;
    notifyListeners();
  }

  void deleteData()
  {
    contactList.removeAt(selectedIndex);
    notifyListeners();
  }

  void updateData(ContactModel c1)
  {
    contactList[selectedIndex] = c1;
    notifyListeners();
  }

  void changeImage()
  {
    selectedImage = null;
    notifyListeners();
  }
}