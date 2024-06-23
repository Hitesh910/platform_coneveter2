import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  Future<void> setName(String name) async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setString("name", name);
    print(name);
  }

  Future<String?> getName() async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    String? name = sha.getString('name');
    print(name);
    return name;
  }

  Future<void> setBio(String bio) async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setString("bio", bio);
  }

  Future<String?> getBio() async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    String? bio = sha.getString('bio');
    return bio;
  }

  Future<void> setCheck(bool check) async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    sha.setBool("check", check);
  }

  Future<bool?> getCheck() async {
    SharedPreferences sha = await SharedPreferences.getInstance();
    bool? check = sha.getBool('check');
    return check;
  }

  Future<void> setData(String mode)
  async {
    SharedPreferences sha =   await SharedPreferences.getInstance();
    sha.setString("theme", mode);
  }

  Future<String?> getData()
  async {
    SharedPreferences share = await SharedPreferences.getInstance();
    String? data = share.getString('theme');
    return data;
  }


}