import 'package:blankscreen/domain/model/news_article_model_ext.dart';
import 'package:blankscreen/domain/model/news_model.dart';

extension NewsModelExt on NewsModel {
  static NewsModel mock() => NewsModel(
        status: 'ok',
        totalResults: 70,
        articles: [
          NewsArticleModelExt.mock00(),
          NewsArticleModelExt.mock01(),
          NewsArticleModelExt.mock02(),
          NewsArticleModelExt.mock03(),
          NewsArticleModelExt.mock04(),
          NewsArticleModelExt.mock05(),
          NewsArticleModelExt.mock06(),
          NewsArticleModelExt.mock07(),
          NewsArticleModelExt.mock08(),
          NewsArticleModelExt.mock09(),
          NewsArticleModelExt.mock10(),
          NewsArticleModelExt.mock11(),
          NewsArticleModelExt.mock12(),
          NewsArticleModelExt.mock13(),
          NewsArticleModelExt.mock14(),
          NewsArticleModelExt.mock15(),
          NewsArticleModelExt.mock16(),
          NewsArticleModelExt.mock17(),
          NewsArticleModelExt.mock18(),
          NewsArticleModelExt.mock19(),
        ],
      );
}
