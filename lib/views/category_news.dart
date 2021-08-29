import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:news_app/widgets/show_loading.dart';
import 'package:recase/recase.dart';

class CategoryNewsPage extends StatefulWidget {
  final String category;
  CategoryNewsPage({required this.category});

  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<NewsArticle> articles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    CategoryNewsClass newsObject = CategoryNewsClass(country: 'in');
    await newsObject.getCategoryNews(widget.category);
    articles = newsObject.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(right: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.category.sentenceCase,
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                ' News ',
                style: TextStyle(color: Colors.red),
              ),
              getIcon(widget.category.toLowerCase()),
            ],
          ),
        ),
      ),
      body: _loading
          ? ShowLoading()
          : SingleChildScrollView(
            physics: ScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: articles.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imageUrl: articles[index].urlToImage,
                              newsDescription: articles[index].description,
                              newsTitle: articles[index].title,
                              author: articles[index].author,
                              url: articles[index].url,
                              publishedAt: articles[index].publishedAt,
                              content: articles[index].content,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
