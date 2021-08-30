import 'package:news_app/views/country_view.dart';
import 'country_view.dart';
import '../widgets/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/helper/news.dart';
import '../widgets/news_tile.dart';
import '../widgets/show_loading.dart';
import 'package:news_app/widgets/app_bar.dart';

class Home extends StatefulWidget {
  static const id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<NewsArticle> newsArticles = [];
  String _countrySelected = 'in';

  bool _loading = true;

  void selectCountry(String country) {
    print(country);
    if (country == null) {
      return;
      // country = _countrySelected;
    }
    setState(() {
      _countrySelected = country;
      getNewsArticles();
    });
  }

  Future<void> getNewsArticles() async {
    News newsObject = News(country: _countrySelected);
    await newsObject.getNews();
    setState(() {
      newsArticles = newsObject.news;
      _loading = false;
    });
  }

  void moveToCountryPage() async {
    final country = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountryPage()),
    );
    _loading = true;

    selectCountry(country);
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        paddingLeft: 50,
        actions: [
          IconButton(
            onPressed: () {
              moveToCountryPage();
            },
            icon: Icon(
              Icons.public,
              color: Colors.red[300],
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => getNewsArticles(),
        child: _loading
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
                              categoryName: categories[index].categoryName,
                              countryName: _countrySelected,
                            );
                          },
                          itemCount: categories.length,
                        ),
                      ),
                      //News Articles
                      Container(
                          child: newsArticles.length != 0
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: newsArticles.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return NewsTile(
                                      imageUrl: newsArticles[index].urlToImage,
                                      newsDescription:
                                          newsArticles[index].description,
                                      newsTitle: newsArticles[index].title,
                                      author: newsArticles[index].author,
                                      url: newsArticles[index].url,
                                      publishedAt:
                                          newsArticles[index].publishedAt,
                                      content: newsArticles[index].content,
                                    );
                                  })
                              : Center(
                                  child: Text('No News Available Right Now'),
                                ))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
