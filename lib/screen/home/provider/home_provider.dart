import 'package:flutter/material.dart';

import '../../contact/model/contact_model.dart';

class HomeProvider with ChangeNotifier
{
  List<ContactModel> contactList = [];
  bool isProfile = false;
  void  profile(bool value)
  {
    value =!value;
    notifyListeners();
  }

  void addContact(ContactModel c1)
  {
    contactList.add(c1);
    notifyListeners();
  }


}