import '../widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/helper/news.dart';
import '../widgets/news_tile.dart';
import '../widgets/show_loading.dart';

class Home extends StatefulWidget {
  static const id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<NewsArticle> newsArticles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNewsArticles();
  }

  getNewsArticles() async {
    News newsObject = News();
    await newsObject.getNews();
    newsArticles = newsObject.news;
    setState(() {
      // Here you can write your code for open new view
      // sleep(Duration(seconds: 10));
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News ',
              style: TextStyle(color: Colors.red[300]),
            ),
            Row(
              children: [
                Text(
                  'Fuse',
                  style: TextStyle(color: Colors.red[300]),
                ),
                Icon(Icons.lightbulb_outline, color: Colors.red[300]),
              ],
            ),
          ],
        ),
      ),
      body: _loading
          ? ShowLoading()
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //Categories
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName);
                        },
                        itemCount: categories.length,
                      ),
                    ),
                    //News Articles
                    Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: newsArticles.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imageUrl: newsArticles[index].urlToImage,
                              newsDescription: newsArticles[index].description,
                              newsTitle: newsArticles[index].title,
                              author: newsArticles[index].author,
                              url: newsArticles[index].url,
                              publishedAt: newsArticles[index].publishedAt,
                              content: newsArticles[index].content,

                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
