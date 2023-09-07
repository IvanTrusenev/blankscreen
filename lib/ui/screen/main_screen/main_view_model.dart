import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModel({
    required this.mainUrl,
  }) {
    init();
  }

  final String mainUrl;
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
      ..loadRequest(Uri.parse(mainUrl));
  }

  Future<void> launchBrowser() async {
    try {
      final Uri uri = Uri.parse(mainUrl);
      await launchUrl(uri);
    } catch (e) {
      /// Nothing to do if Url is invalid or browser not start
    }
  }
}
