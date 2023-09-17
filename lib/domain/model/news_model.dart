import 'package:EURB/domain/model/base/has_json.dart';
import 'package:EURB/domain/model/news_article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel implements HasJson {
  const NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  const NewsModel.empty()
      : this(
          status: '',
          totalResults: 0,
          articles: const [],
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  @JsonKey(name: 'status', defaultValue: '')
  final String status;

  @JsonKey(name: 'totalResults', defaultValue: 0)
  final int totalResults;

  @JsonKey(name: 'articles', defaultValue: [])
  final List<NewsArticleModel> articles;

  @override
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
