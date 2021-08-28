import 'dart:convert';
import 'package:news_app/models/news_article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsArticle> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=cdaf1822fcfe44e08812c6010526db5c';

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
