import 'package:flutter/material.dart';
import 'web_view.dart';
import 'package:news_app/widgets/app_bar.dart';
import 'package:news_app/widgets/news_information.dart';
import 'package:news_app/helper/constants.dart';

class ScreenArguments {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final String content;
  final String author;
  final String publishedAt;

  ScreenArguments(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.author,
      required this.content,
      required this.publishedAt,
      required this.url});
}

class ArticleView extends StatelessWidget {
  static const id = 'articleView';
  @override
  Widget build(BuildContext context) {
    bool present = true;
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        paddingLeft: 45,
        actions: [
          IconButton(
            onPressed: () {},
            // onPressed: () async {
            //   if (!present) {
            //     addsaved(article);
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //       content: Text("Added to Saved News"),
            //     ));
            //     setState(() {
            //       present = !present;
            //     });
            //   } else {
            //     deleteItem(article.url);
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //       content: Text("Removed From Saved News"),
            //     ));
            //     setState(() {
            //       // present = !present;
            //     });
            //   }
            // },
            icon: Icon(
              present
                  ? Icons.bookmark_outline_sharp
                  : Icons.bookmark_outline_sharp,
              color: Colors.blue,
              size: 36,
            ),
          ),
          IconButton(
            onPressed: () {},
            // onPressed: () => shareNews(article),
            icon: Icon(
              Icons.share,
              color: Colors.blue,
              size: 32,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                image: NetworkImage(args.imageUrl),
                placeholder: AssetImage('assets/images/newsPlaceholder.jpg'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/newsPlaceholder.jpg',
                    fit: BoxFit.fitWidth,
                  );
                },
                fit: BoxFit.fitWidth,
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  args.title,
                  style: kNewsTitleStyle,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NewsInforamation(
                      infoTitle: 'Author',
                      infoData: args.author,
                    ),
                    SizedBox(width: 10),
                    NewsInforamation(
                      infoTitle: 'Published At',
                      infoData: args.publishedAt
                          .substring(0, 16)
                          .replaceAll(RegExp('T'), ' '),
                    )
                  ],
                ),
                Divider(height: 20, thickness: 2),
                Text(
                  args.description,
                  style: TextStyle(height: 1.3),
                ),
                Text(
                  args.content == null
                      ? 'Read full article at the link given below.'
                      : args.content.substring(0, 200),
                  overflow: TextOverflow.visible,
                  style: kNewsContentStyle,
                ),
                SizedBox(height: 20),
                args.url != null
                    ? Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: InkWell(
                            child: Text(
                              'Read Full Article >>',
                              style: kNewsLinkStyle,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WebViewPage(url: args.url),
                                ),
                              );
                            }),
                      )
                    : Container(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
