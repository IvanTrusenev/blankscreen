import 'package:blankscreen/ui/screen/news_screen/widget/news_web_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatelessWidget {
  const NewsWebViewScreen({
    super.key,
    required this.newsUrl,
  });

  final String newsUrl;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NewsWebViewViewModel(newsUrl: newsUrl),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
            child: WebViewWidget(
              controller: context.read<NewsWebViewViewModel>().webViewController,
            ),
          );
        },
      ),
    );
  }
}
