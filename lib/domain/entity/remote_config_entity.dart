import 'package:hive/hive.dart';

part 'remote_config_entity.g.dart';

@HiveType(typeId: 1)
class RemoteConfigEntity extends HiveObject {
  RemoteConfigEntity({
    required this.mainUrl,
  });

  RemoteConfigEntity.empty()
      : this(
          mainUrl: '',
        );

  @HiveField(0, defaultValue: '')
  final String mainUrl;
}
