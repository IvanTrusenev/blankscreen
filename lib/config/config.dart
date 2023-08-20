import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Config {
  /// Singleton ->
  static final Config _instance = Config._internal();

  Config._internal();

  factory Config() => _instance;

  /// Singleton <-

  /// Api ->
  String get apiAuthority => 'newsapi.org';

  String get apiPath => 'v2/top-headlines';

  String get apiKey => 'ee1feb3f9f4149b0aeb32ae9165a4bde';

  /// API <-

  String get documentsDirectory => _documentsDirectory;
  String _documentsDirectory = '';

  Future<void> init() async {
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    _documentsDirectory = documentsDirectory.path;
  }
}
