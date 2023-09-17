import 'dart:io';

import 'package:EURB/config/config.dart';
import 'package:EURB/domain/model/base/has_json.dart';
import 'package:EURB/domain/model/news_model.dart';
import 'package:EURB/domain/model/news_model_ext.dart';

class ApiConnector {
  /// Singleton ->
  static ApiConnector? _instance;

  ApiConnector._internal({
    required this.config,
  });

  factory ApiConnector({
    required Config config,
  }) {
    return _instance ??= ApiConnector._internal(
      config: config,
    );
  }

  /// Singleton <-

  final Config config;

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup(config.apiAuthority);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<NewsModel> getNewsMock(HasJson params) async => NewsModelExt.mock();
}
