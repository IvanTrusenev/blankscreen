import 'package:EURB/domain/entity/news_article_entity.dart';
import 'package:EURB/domain/entity/news_entity.dart';
import 'package:EURB/domain/mapper/news_article_mapper.dart';
import 'package:EURB/domain/model/news_article_model.dart';
import 'package:EURB/domain/model/news_model.dart';

class NewsMapper {
  const NewsMapper._internal({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsMapper.fromModel(NewsModel model) {
    final List<NewsArticleMapper> articles = model.articles.map((model) => NewsArticleMapper.fromModel(model)).toList(growable: false);

    return NewsMapper._internal(
      status: model.status,
      totalResults: model.totalResults,
      articles: articles,
    );
  }

  factory NewsMapper.fromEntity(NewsEntity entity) {
    final List<NewsArticleMapper> articles = entity.articles.map((entity) => NewsArticleMapper.fromEntity(entity)).toList(growable: false);

    return NewsMapper._internal(
      status: entity.status,
      totalResults: entity.totalResults,
      articles: articles,
    );
  }

  final String status;
  final int totalResults;
  final List<NewsArticleMapper> articles;

  NewsModel get model {
    final List<NewsArticleModel> articles = this.articles.map((mapper) => mapper.model).toList(growable: false);

    return NewsModel(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }

  NewsEntity get entity {
    final List<NewsArticleEntity> articles = this.articles.map((mapper) => mapper.entity).toList(growable: false);

    return NewsEntity(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }
}
