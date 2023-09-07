import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewViewModel extends ChangeNotifier {
  NewsWebViewViewModel({
    required this.newsUrl,
  }) {
    init();
  }

  final String newsUrl;
  late final WebViewController webViewController;

  void init() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {},
          // onPageStarted: (String url) {},
          // onPageFinished: (String url) {},
          // onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(newsUrl));
  }
}
