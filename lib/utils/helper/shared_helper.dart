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

  Future<void> setData(bool theme)
  async {
    SharedPreferences sha =   await SharedPreferences.getInstance();
    sha.setBool("theme", theme);
  }

  Future<bool?> getData()
  async {
    SharedPreferences share = await SharedPreferences.getInstance();
    bool? data = share.getBool('theme');
    return data;
  }

  Future<void> setImage(String data)
  async {
    SharedPreferences share = await SharedPreferences.getInstance();
     share.setString("image", data);
  }

  Future<String?> getImage()
  async {
    SharedPreferences share = await SharedPreferences.getInstance();
    String? image = share.getString("image");
    return image;
  }


}