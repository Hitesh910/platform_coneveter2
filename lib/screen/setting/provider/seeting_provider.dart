
import 'package:flutter/material.dart';

import '../../../utils/helper/shared_helper.dart';

class SettingProvider with ChangeNotifier
{
  SharedHelper share = SharedHelper();
  String? name;
  String? bio;
  bool? check;
  String? theme;

  bool isProfile = false;

  void saveTheme(String theme) {
    share.setData(theme);
    getTheme();
  }

  void getTheme()async{
    theme = await share.getData();
    notifyListeners();
  }

  void  profile(bool value)
  {
    isProfile =value;
    notifyListeners();
  }

  void saveData(String name)
  {
    share.setName(name);
  }

  void getData()
  async
  {
    name = await share.getName();
    notifyListeners();
  }

  void saveBio(String Bio)
  {
    share.setBio(Bio);
  }

  void getBio()
  async
  {
    bio = await share.getBio();
    notifyListeners();
  }

  void setCheck(bool check) {
    share.setCheck(check);
  }

  void getCheck()
  async
  {
    check = await share.getCheck();
    notifyListeners();
  }
}