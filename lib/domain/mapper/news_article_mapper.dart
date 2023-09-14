import 'package:blankscreen/domain/entity/news_article_entity.dart';
import 'package:blankscreen/domain/mapper/news_source_mapper.dart';
import 'package:blankscreen/domain/model/news_article_model.dart';

class NewsArticleMapper {
  const NewsArticleMapper._internal({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.assetImage,
  });

  factory NewsArticleMapper.fromModel(NewsArticleModel model) {
    return NewsArticleMapper._internal(
      source: NewsSourceMapper.fromModel(model.source),
      author: model.author,
      title: model.title,
      description: model.description,
      url: model.url,
      urlToImage: model.urlToImage,
      publishedAt: model.publishedAt,
      content: model.content,
      assetImage: model.assetImage,
    );
  }

  factory NewsArticleMapper.fromEntity(NewsArticleEntity entity) {
    return NewsArticleMapper._internal(
      source: NewsSourceMapper.fromEntity(entity.source),
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
      assetImage: entity.assetImage,
    );
  }

  final NewsSourceMapper source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String assetImage;

  NewsArticleModel get model => NewsArticleModel(
        source: source.model,
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
        assetImage: assetImage,
      );

  NewsArticleEntity get entity => NewsArticleEntity(
        source: source.entity,
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
        assetImage: assetImage,
      );
}
