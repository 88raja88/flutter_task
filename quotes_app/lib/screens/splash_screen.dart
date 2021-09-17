import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotes_app/screens/loginScreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), finished);
  }

  void finished() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    debugPrint("Finished......");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
         decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://images-na.ssl-images-amazon.com/images/I/51nrdDqtx2L.png"),
                fit: BoxFit.cover)
        ),
        ),
      ),
    );
  }
}