import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),() {
      Navigator.pushReplacementNamed(context, "/home");
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(height: 100,width:100,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/contact.png"))),),
          ),
          Text("Platform Conevertor")
        ],
      ),
    );
  }
}
