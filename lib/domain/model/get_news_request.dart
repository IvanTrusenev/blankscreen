import 'package:EURB/domain/model/base/has_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_news_request.g.dart';

@JsonSerializable()
class GetNewsRequest implements HasJson {
  const GetNewsRequest({
    required this.apiKey,
    required this.category,
    required this.country,
  });

  const GetNewsRequest.sport({
    required String apiKey,
  }) : this(
          apiKey: apiKey,
          category: 'sports',
          country: 'us',
        );

  factory GetNewsRequest.fromJson(Map<String, dynamic> json) => _$GetNewsRequestFromJson(json);

  @JsonKey(name: 'apiKey', defaultValue: '')
  final String apiKey;

  @JsonKey(name: 'category', defaultValue: '')
  final String category;

  @JsonKey(name: 'country', defaultValue: '')
  final String country;

  @override
  Map<String, dynamic> toJson() => _$GetNewsRequestToJson(this);
}
