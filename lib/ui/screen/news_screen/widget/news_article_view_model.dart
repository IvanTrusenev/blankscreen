import 'package:blankscreen/domain/model/news_article_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsArticleViewModel extends ChangeNotifier {
  NewsArticleViewModel({
    required this.article,
  });

  final NewsArticleModel article;

  void showNewsArticle(BuildContext context) => context.go('/details', extra: {'NewsUrl': article.url});

  void showNewsArticle2(BuildContext context) => context.go('/details2', extra: {'Article': article});
}
