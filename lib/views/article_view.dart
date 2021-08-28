import 'package:flutter/material.dart';

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
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red[300],
          ),
        ),
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
              present ? Icons.bookmark_sharp : Icons.bookmark_outline_sharp,
              color: Colors.red[300],
              size: 36,
            ),
          ),
          IconButton(
            onPressed: () {},
            // onPressed: () => shareNews(article),
            icon: Icon(
              Icons.share,
              color: Colors.red[300],
              size: 32,
            ),
          )
        ],
      ),
      // backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child:
                  //article.urlToImage == null || article.urlToImage.isEmpty
                  //?
                  Container(
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
          )
              // : customImage(article.urlToImage),

              ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  args.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.red[300],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black12),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Author',
                            style: TextStyle(color: Colors.black87),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            args.author == null ? 'Anonymous' : args.author,
                            style: TextStyle(color: Colors.red[300]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Colors.black12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Published At'),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              args.publishedAt == null
                                  ? ' '
                                  : args.publishedAt
                                      .substring(0, 16)
                                      .replaceAll(RegExp('T'), ' '),
                              style: TextStyle(color: Colors.red[300]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(height: 20, thickness: 2),
                Text(
                  args.content == null
                      ? 'Read full article at the link given below.'
                      : args.content.substring(0, 200),
                  // style: kh5Style,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),
                // article.url != null
                // ?
                InkWell(
                    child: Text(
                      'Read Full Article >>',
                      style: TextStyle(
                          color: Colors.red[300],
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             NewsWebView(url: args.url)));
                    })
                // :
                // Container()
              ],
            ),
          ))
        ],
      ),
    );
  }
}
