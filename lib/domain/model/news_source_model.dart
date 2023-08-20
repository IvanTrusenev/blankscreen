import 'package:blankscreen/domain/model/base/has_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_source_model.g.dart';

@JsonSerializable()
class NewsSourceModel implements HasJson {
  const NewsSourceModel({
    required this.id,
    required this.name,
  });

  const NewsSourceModel.empty()
      : this(
          id: '',
          name: '',
        );

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) => _$NewsSourceModelFromJson(json);

  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  Map<String, dynamic> toJson() => _$NewsSourceModelToJson(this);
}
