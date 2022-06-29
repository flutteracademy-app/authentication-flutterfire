import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutteracademy extends StatefulWidget {
  const WebViewFlutteracademy({Key? key}) : super(key: key);

  @override
  WebViewFlutteracademyState createState() => WebViewFlutteracademyState();
}

class WebViewFlutteracademyState extends State<WebViewFlutteracademy> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Esta es mi web"),
        ),
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://flutteracademy.app',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            gestureNavigationEnabled: true,
          );
        }));
  }
}
