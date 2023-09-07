import 'package:blankscreen/domain/entity/news_source_entity.dart';
import 'package:blankscreen/domain/model/news_source_model.dart';

class NewsSourceMapper {
  const NewsSourceMapper._internal({
    required this.id,
    required this.name,
  });

  factory NewsSourceMapper.fromModel(NewsSourceModel model) {
    return NewsSourceMapper._internal(
      id: model.id,
      name: model.name,
    );
  }

  factory NewsSourceMapper.fromEntity(NewsSourceEntity entity) {
    return NewsSourceMapper._internal(
      id: entity.id,
      name: entity.name,
    );
  }

  final String id;
  final String name;

  NewsSourceModel get model => NewsSourceModel(
        id: id,
        name: name,
      );

  NewsSourceEntity get entity => NewsSourceEntity(
        id: id,
        name: name,
      );
}
