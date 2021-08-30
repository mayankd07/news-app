import 'dart:convert';
import 'package:news_app/models/news_article_model.dart';
import 'package:http/http.dart' as http;

class News {
  final String country;
  List<NewsArticle> news = [];
  News({required this.country});
  void passCountry() {
    CategoryNewsClass(country: country);
  }

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?pageSize=50&country=$country&category=general&apiKey=cdaf1822fcfe44e08812c6010526db5c';
   
    http.Response response = await http.get(Uri.parse(url));
  

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          NewsArticle newsArticle = NewsArticle(
              author: article['author'],
              content: article['content'],
              description: article['description'],
              title: article['title'],
              url: article['url'],
              urlToImage: article['urlToImage'],
              publishedAt: article['publishedAt']);
          news.add(newsArticle);
          
        }
      });
    } else {
      print(jsonData['code']);
    }
  }
}

class CategoryNewsClass {
  List<NewsArticle> news = [];
  final String country;
  CategoryNewsClass({required this.country});

  Future<void> getCategoryNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?pageSize=50&country=$country&category=$category&apiKey=cdaf1822fcfe44e08812c6010526db5c';

    http.Response response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          NewsArticle newsArticle = NewsArticle(
              author: article['author'],
              content: article['content'],
              description: article['description'],
              title: article['title'],
              url: article['url'],
              urlToImage: article['urlToImage'],
              publishedAt: article['publishedAt']);
          news.add(newsArticle);
        }
      });
    }
  }
}
