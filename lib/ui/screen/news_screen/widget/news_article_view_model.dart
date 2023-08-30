import 'package:blankscreen/domain/model/news_article_model.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArticleViewModel extends ChangeNotifier {
  NewsArticleViewModel({
    required this.article,
  });

  final NewsArticleModel article;

  Future<void> launchBrowser() async {
    try {
      final Uri uri = Uri.parse(article.url);
      await launchUrl(uri);
    } catch (e) {
      /// Nothing to do if Url is invalid or browser not start
    }
  }
}
