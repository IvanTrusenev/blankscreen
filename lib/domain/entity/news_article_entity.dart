import 'package:blankscreen/domain/entity/news_source_entity.dart';
import 'package:hive/hive.dart';

part 'news_article_entity.g.dart';

@HiveType(typeId: 3)
class NewsArticleEntity {
  const NewsArticleEntity({
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

  const NewsArticleEntity.empty()
      : this(
          source: const NewsSourceEntity.empty(),
          author: '',
          title: '',
          description: '',
          url: '',
          urlToImage: '',
          publishedAt: '',
          content: '',
          assetImage: '',
        );

  @HiveField(0, defaultValue: NewsSourceEntity.empty())
  final NewsSourceEntity source;

  @HiveField(1, defaultValue: '')
  final String author;

  @HiveField(2, defaultValue: '')
  final String title;

  @HiveField(3, defaultValue: '')
  final String description;

  @HiveField(4, defaultValue: '')
  final String url;

  @HiveField(5, defaultValue: '')
  final String urlToImage;

  @HiveField(6, defaultValue: '')
  final String publishedAt;

  @HiveField(7, defaultValue: '')
  final String content;

  @HiveField(8, defaultValue: '')
  final String assetImage;
}
