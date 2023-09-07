import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/domain/entity/news_article_entity.dart';
import 'package:blankscreen/domain/entity/news_entity.dart';
import 'package:blankscreen/domain/entity/news_source_entity.dart';
import 'package:blankscreen/domain/entity/remote_config_entity.dart';
import 'package:hive/hive.dart';

class Database {
  /// Singleton ->
  static Database? _instance;

  Database._internal({
    required this.config,
  });

  factory Database({
    required Config config,
  }) {
    return _instance ??= Database._internal(
      config: config,
    );
  }

  /// Singleton <-

  final Config config;

  String get _databasePath => Config().documentsDirectory;

  /// Remote config  ->
  String get _remoteConfigBoxName => 'RemoteConfig';

  String get _remoteConfigKey => _remoteConfigBoxName;

  late final Box<RemoteConfigEntity> _remoteConfigBox;

  /// Remote config  ->

  /// News ->
  String get _newsBoxName => 'News';

  String get _newsKey => _newsBoxName;

  late final Box<NewsEntity> _newsBox;

  /// News <-

  Future<void> init() async {
    Hive
      ..init(_databasePath)
      ..registerAdapter(RemoteConfigEntityAdapter())
      ..registerAdapter(NewsSourceEntityAdapter())
      ..registerAdapter(NewsArticleEntityAdapter())
      ..registerAdapter(NewsEntityAdapter());

    _remoteConfigBox = await Hive.openBox<RemoteConfigEntity>(_remoteConfigBoxName);
    _newsBox = await Hive.openBox<NewsEntity>(_newsBoxName);
  }

  RemoteConfigEntity readRemoteConfig() {
    if (_remoteConfigBox.containsKey(_remoteConfigKey)) {
      return _remoteConfigBox.get(_remoteConfigKey)!;
    }
    return RemoteConfigEntity.empty();
  }

  Future<void> writeRemoteConfig(RemoteConfigEntity record) async {
    _remoteConfigBox.put(_remoteConfigKey, record);
  }

  NewsEntity readNews() {
    if (_newsBox.containsKey(_newsKey)) {
      return _newsBox.get(_newsKey)!;
    }
    return NewsEntity.empty();
  }

  Future<void> writeNews(NewsEntity record) async {
    _newsBox.put(_newsKey, record);
  }
}
