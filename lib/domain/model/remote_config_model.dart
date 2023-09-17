import 'package:EURB/domain/model/base/has_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_config_model.g.dart';

@JsonSerializable()
class RemoteConfigModel implements HasJson {
  const RemoteConfigModel({
    required this.mainUrl,
  });

  const RemoteConfigModel.empty()
      : this(
          mainUrl: '',
        );

  factory RemoteConfigModel.fromJson(Map<String, dynamic> json) => _$RemoteConfigModelFromJson(json);

  @JsonKey(name: 'MainUrl', defaultValue: '')
  final String mainUrl;

  @override
  Map<String, dynamic> toJson() => _$RemoteConfigModelToJson(this);
}
