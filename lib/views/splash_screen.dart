import 'package:news_app/views/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  static const id = 'splashScreenPage';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Home(),
        title: Text(
          'News Fuse',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue),
        ),
        image: Image.asset('assets/images/splashScreen.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.red);
  }
}
