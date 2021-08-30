import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

import 'package:news_app/views/country_view.dart';
import 'views/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



 
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      
      initialRoute: Home.id,
      routes: {
        Home.id: (context)=>Home(),
        ArticleView.id: (context)=>ArticleView(),
        CountryPage.id: (context)=>CountryPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'News Fuse',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: CountryPage(),
    );
  }
}


