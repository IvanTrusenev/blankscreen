import 'package:blankscreen/domain/model/news_article_model.dart';
import 'package:blankscreen/ui/screen/base_screen/base_screen.dart';
import 'package:blankscreen/ui/screen/news_screen/widget/news_article_details.dart';
import 'package:blankscreen/ui/screen/news_screen/widget/news_web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const BaseScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final Map<String, dynamic> params = state.extra as Map<String, dynamic>;
            final String newsUrl = params['NewsUrl'] as String? ?? '';
            return NewsWebViewScreen(newsUrl: newsUrl);
          },
        ),
        GoRoute(
          path: 'details2',
          builder: (BuildContext context, GoRouterState state) {
            final Map<String, dynamic> params = state.extra as Map<String, dynamic>;
            final NewsArticleModel article = params['Article'] as NewsArticleModel? ?? const NewsArticleModel.empty();
            return NewsArticleDetails(article: article);
          },
        ),
      ],
    ),
  ],
);
