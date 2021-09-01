import 'dart:async';
import 'package:news_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  WebViewPage({required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool loading = true;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        paddingLeft: 0,
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.safety_divider),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        WebView(
          onPageFinished: (finish) {
            setState(() {
              loading = false;
            });
          },
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
        loading
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitChasingDots(
                    color: Colors.red[300],
                    size: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading...')
                ],
              )
            : Stack(),
      ]),
    );
  }
}
