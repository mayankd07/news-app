import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';
import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        Home.id: (context)=>Home(),
        ArticleView.id: (context)=>ArticleView(),
      },
      debugShowCheckedModeBanner: false,
      title: 'News Fuse',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
