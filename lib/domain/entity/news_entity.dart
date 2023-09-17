import 'package:EURB/domain/entity/news_article_entity.dart';
import 'package:hive/hive.dart';

part 'news_entity.g.dart';

@HiveType(typeId: 4)
class NewsEntity extends HiveObject {
  NewsEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsEntity.empty()
      : this(
          status: '',
          totalResults: 0,
          articles: const [],
        );

  @HiveField(0, defaultValue: '')
  final String status;

  @HiveField(1, defaultValue: 0)
  final int totalResults;

  @HiveField(2, defaultValue: [])
  final List<NewsArticleEntity> articles;
}
