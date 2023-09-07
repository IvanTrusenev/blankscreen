import 'package:hive/hive.dart';

part 'news_source_entity.g.dart';

@HiveType(typeId: 2)
class NewsSourceEntity {
  const NewsSourceEntity({
    required this.id,
    required this.name,
  });

  const NewsSourceEntity.empty()
      : this(
          id: '',
          name: '',
        );

  @HiveField(0, defaultValue: '')
  final String id;

  @HiveField(1, defaultValue: '')
  final String name;
}
