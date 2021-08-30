import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/helper/constants.dart';

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
        Navigator.pushNamed(
          context,
          ArticleView.id,
          arguments: ScreenArguments(
            title: newsTitle,
            imageUrl: imageUrl,
            description: newsDescription,
            url: url,
            content: content,
            author: author,
            publishedAt: publishedAt,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 5, top: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FadeInImage(
                    placeholder:
                        AssetImage('assets/images/newsPlaceholder.jpg'),
                    image: NetworkImage(imageUrl),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/newsPlaceholder.jpg',
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
                  style: kNewsTitleStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  newsDescription,
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}


// FadeInImage(
//                 image: NetworkImage(imageUrl),
//                 placeholder: AssetImage('assets/images/newsPlaceholder.jpg'),
//                 imageErrorBuilder: (context, error, stackTrace) {
//                   return Image.asset(
//                     'assets/images/errorImage.jpg',
//                     fit: BoxFit.fitWidth,
//                   );
//                 },
//                 fit: BoxFit.fitWidth,
//               ),