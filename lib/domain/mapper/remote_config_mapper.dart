import 'package:blankscreen/domain/entity/remote_config_entity.dart';
import 'package:blankscreen/domain/model/remote_config_model.dart';

class RemoteConfigMapper {
  const RemoteConfigMapper._internal({
    required this.mainUrl,
  });

  factory RemoteConfigMapper.fromModel(RemoteConfigModel model) {
    return RemoteConfigMapper._internal(
      mainUrl: model.mainUrl,
    );
  }

  factory RemoteConfigMapper.fromEntity(RemoteConfigEntity entity) {
    return RemoteConfigMapper._internal(
      mainUrl: entity.mainUrl,
    );
  }

  final String mainUrl;

  RemoteConfigModel get model => RemoteConfigModel(
        mainUrl: mainUrl,
      );

  RemoteConfigEntity get entity => RemoteConfigEntity(
        mainUrl: mainUrl,
      );
}
