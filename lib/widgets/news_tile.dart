import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class NewsTile extends StatelessWidget {
  final String newsTitle,
      imageUrl,
      newsDescription,
      author,
      publishedAt,
      url,
      content;
  NewsTile({
    required this.imageUrl,
    required this.newsDescription,
    required this.newsTitle,
    required this.publishedAt,
    required this.url,
    required this.content,
    required this.author,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ArticleView.id,
            arguments: ScreenArguments(
                title: newsTitle,
                imageUrl: imageUrl,
                description: newsDescription,
                url: url,
                content: content,
                author: author,
                publishedAt: publishedAt));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 0),
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                image: NetworkImage(imageUrl),
                placeholder: AssetImage('assets/images/newsPlaceholder.jpg'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/newsPlaceholder.jpg',
                      fit: BoxFit.fitWidth,
                      );
                },
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              newsTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              newsDescription,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
