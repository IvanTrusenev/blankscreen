import 'package:blankscreen/domain/model/base/has_json.dart';
import 'package:blankscreen/domain/model/news_source_model.dart';

class NewsArticleModel implements HasJson {
  const NewsArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  const NewsArticleModel.empty()
      : this(
          source: const NewsSourceModel.empty(),
          author: '',
          title: '',
          description: '',
          url: '',
          urlToImage: '',
          publishedAt: '',
          content: '',
        );

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic>? sourceRaw = json[_sourceKey];
    late final NewsSourceModel source;
    if (sourceRaw == null) {
      source = const NewsSourceModel.empty();
    } else {
      source = NewsSourceModel.fromJson(sourceRaw);
    }

    return NewsArticleModel(
      source: source,
      author: json[_authorKey] as String? ?? '',
      title: json[_titleKey] as String? ?? '',
      description: json[_descriptionKey] as String? ?? '',
      url: json[_urlKey] as String? ?? '',
      urlToImage: json[_urlToImageKey] as String? ?? '',
      publishedAt: json[_publishedAtKey] as String? ?? '',
      content: json[_contentKey] as String? ?? '',
    );
  }

  final NewsSourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  @override
  Map<String, dynamic> toJson() => {
        _sourceKey: source,
        _authorKey: author,
        _titleKey: title,
        _descriptionKey: description,
        _urlKey: url,
        _urlToImageKey: urlToImage,
        _publishedAtKey: publishedAt,
        _contentKey: content,
      };

  static const _sourceKey = 'source';
  static const _authorKey = 'author';
  static const _titleKey = 'title';
  static const _descriptionKey = 'description';
  static const _urlKey = 'url';
  static const _urlToImageKey = 'urlToImage';
  static const _publishedAtKey = 'publishedAt';
  static const _contentKey = 'content';
}
